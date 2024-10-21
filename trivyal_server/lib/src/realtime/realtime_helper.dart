import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:serverpod/serverpod.dart';

typedef InitialDataFn<TModel> = Future<List<TModel>> Function();

typedef ShouldProcessEventFn<TModel> = bool Function(
  ObjectWriteEvent type,
  TModel data,
);

typedef TransformDataFn<TModel> = List<TModel> Function(List<TModel> data);

typedef InitialDatumFn<TModel> = Future<TModel> Function();

enum ObjectWriteEvent { created, updated, deleted }

extension RealtimeHelper on Session {
  Stream<TRes> watchAll<TRes, TModel extends TableRow>({
    required InitialDataFn<TModel> fetchFromDB,
    required TransformDataFn<TModel> transform,
    required TRes Function(List<TModel> data) toResponse,
    required ShouldProcessEventFn<TModel> shouldProcessEvent,
    Equality<TModel> equality = const DefaultEquality(),
    String? Function(ObjectWriteEvent)? overrideChannelName,
    List<ObjectWriteEvent> watchEvents = ObjectWriteEvent.values,
  }) async* {
    assert(
      watchEvents.isNotEmpty,
      'At least one event type must be added to watchEvents',
    );

    final initialData = await fetchFromDB();

    yield toResponse(initialData);

    // Watch all required write events by subscribing to their respective channel
    yield* Rx.merge(
      watchEvents.toSet().map(
            (eventType) => _createEventStream<TModel>(
              eventType,
              channelName: overrideChannelName?.call(eventType),
            ),
          ),
    )
        .where(
          // Only process events that match the shouldProcessEvent function
          (event) => shouldProcessEvent(event.type, event.data),
        )
        .scan(
          (latestData, event, _) {
            // Merge the write event with lastResult data
            List<TModel> newData = switch (event.type) {
              ObjectWriteEvent.created => [...latestData, event.data],
              ObjectWriteEvent.updated =>
                latestData.map((o) => o.id == event.data.id ? event.data : o),
              ObjectWriteEvent.deleted =>
                latestData.where((o) => o.id != event.data.id),
            }
                .toList();

            // Sort and filter to match the original database query
            newData = transform(newData);

            // return the new latestData
            return newData;
          },
          // Initial latest result
          initialData,
        )
        // Only send newData if it is different from the previous result
        .distinct(DeepCollectionEquality(equality).equals)
        .map((newData) => toResponse(newData));
  }

  Stream<TRes?> watchSingle<TRes, TModel>({
    required InitialDatumFn<TModel?> fetchFromDB,
    required TRes? Function(TModel? datum) toResponse,
    required ShouldProcessEventFn<TModel> shouldProcessEvent,
    Equality<TModel?> equality = const DefaultEquality(),
    String? Function(ObjectWriteEvent)? overrideChannelName,
    List<ObjectWriteEvent> watchEvents = ObjectWriteEvent.values,
  }) async* {
    assert(
      watchEvents.isNotEmpty,
      'At least one event type must be added to watchEvents',
    );

    final initialData = await fetchFromDB();

    yield toResponse(initialData);

    // Watch all required write events by subscribing to their respective channel
    yield* Rx.merge(
      watchEvents.toSet().map(
            (eventType) => _createEventStream<TModel>(
              eventType,
              channelName: overrideChannelName?.call(eventType),
            ),
          ),
    )
        .where(
          // Only process events that match the shouldProcessEvent function
          (event) => shouldProcessEvent(event.type, event.data),
        )
        .map(
          (event) => event.type == ObjectWriteEvent.updated ||
                  event.type == ObjectWriteEvent.created
              ? event.data
              : null,
        )
        // Only send newData if it is different from the previous result
        .distinct(equality.equals)
        .map((newData) => toResponse(newData));
  }

  // Watches a single event type on session.messages
  Stream<({ObjectWriteEvent type, TModel data})> _createEventStream<TModel>(
    ObjectWriteEvent event, {
    String? channelName,
  }) =>
      messages
          .createStream<TModel>(channelName ?? '$TModel.${event.name}')
          .map((o) => (type: event, data: o));
}
