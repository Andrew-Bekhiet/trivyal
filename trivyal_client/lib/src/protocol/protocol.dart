/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'choice.dart' as _i2;
import 'game.dart' as _i3;
import 'game_list_response.dart' as _i4;
import 'live_game.dart' as _i5;
import 'question.dart' as _i6;
import 'protocol.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
export 'choice.dart';
export 'game.dart';
export 'game_list_response.dart';
export 'live_game.dart';
export 'question.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Choice) {
      return _i2.Choice.fromJson(data) as T;
    }
    if (t == _i3.Game) {
      return _i3.Game.fromJson(data) as T;
    }
    if (t == _i4.GameListResponse) {
      return _i4.GameListResponse.fromJson(data) as T;
    }
    if (t == _i5.LiveGame) {
      return _i5.LiveGame.fromJson(data) as T;
    }
    if (t == _i6.Question) {
      return _i6.Question.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Choice?>()) {
      return (data != null ? _i2.Choice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Game?>()) {
      return (data != null ? _i3.Game.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.GameListResponse?>()) {
      return (data != null ? _i4.GameListResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.LiveGame?>()) {
      return (data != null ? _i5.LiveGame.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Question?>()) {
      return (data != null ? _i6.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i7.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i7.Game>) {
      return (data as List).map((e) => deserialize<_i7.Game>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Choice>) {
      return (data as List).map((e) => deserialize<_i7.Choice>(e)).toList()
          as dynamic;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Choice) {
      return 'Choice';
    }
    if (data is _i3.Game) {
      return 'Game';
    }
    if (data is _i4.GameListResponse) {
      return 'GameListResponse';
    }
    if (data is _i5.LiveGame) {
      return 'LiveGame';
    }
    if (data is _i6.Question) {
      return 'Question';
    }
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Choice') {
      return deserialize<_i2.Choice>(data['data']);
    }
    if (data['className'] == 'Game') {
      return deserialize<_i3.Game>(data['data']);
    }
    if (data['className'] == 'GameListResponse') {
      return deserialize<_i4.GameListResponse>(data['data']);
    }
    if (data['className'] == 'LiveGame') {
      return deserialize<_i5.LiveGame>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i6.Question>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
