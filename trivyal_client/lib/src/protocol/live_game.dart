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

abstract class LiveGame implements _i1.SerializableModel {
  LiveGame._({
    this.id,
    required this.pin,
    required this.gameId,
  });

  factory LiveGame({
    int? id,
    required int pin,
    required int gameId,
  }) = _LiveGameImpl;

  factory LiveGame.fromJson(Map<String, dynamic> jsonSerialization) {
    return LiveGame(
      id: jsonSerialization['id'] as int?,
      pin: jsonSerialization['pin'] as int,
      gameId: jsonSerialization['gameId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pin;

  int gameId;

  LiveGame copyWith({
    int? id,
    int? pin,
    int? gameId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pin': pin,
      'gameId': gameId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LiveGameImpl extends LiveGame {
  _LiveGameImpl({
    int? id,
    required int pin,
    required int gameId,
  }) : super._(
          id: id,
          pin: pin,
          gameId: gameId,
        );

  @override
  LiveGame copyWith({
    Object? id = _Undefined,
    int? pin,
    int? gameId,
  }) {
    return LiveGame(
      id: id is int? ? id : this.id,
      pin: pin ?? this.pin,
      gameId: gameId ?? this.gameId,
    );
  }
}
