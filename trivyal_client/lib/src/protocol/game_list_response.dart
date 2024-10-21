/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class GameListResponse implements _i1.SerializableModel {
  GameListResponse._({required this.data});

  factory GameListResponse({required List<_i2.Game> data}) =
      _GameListResponseImpl;

  factory GameListResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameListResponse(
        data: (jsonSerialization['data'] as List)
            .map((e) => _i2.Game.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.Game> data;

  GameListResponse copyWith({List<_i2.Game>? data});
  @override
  Map<String, dynamic> toJson() {
    return {'data': data.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GameListResponseImpl extends GameListResponse {
  _GameListResponseImpl({required List<_i2.Game> data}) : super._(data: data);

  @override
  GameListResponse copyWith({List<_i2.Game>? data}) {
    return GameListResponse(
        data: data ?? this.data.map((e0) => e0.copyWith()).toList());
  }
}
