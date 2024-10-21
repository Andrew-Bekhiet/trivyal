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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.userId,
    required this.name,
    this.games,
  });

  factory User({
    int? id,
    required int userId,
    required String name,
    List<_i2.Game>? games,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      name: jsonSerialization['name'] as String,
      games: (jsonSerialization['games'] as List?)
          ?.map((e) => _i2.Game.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String name;

  List<_i2.Game>? games;

  User copyWith({
    int? id,
    int? userId,
    String? name,
    List<_i2.Game>? games,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
      if (games != null) 'games': games?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required int userId,
    required String name,
    List<_i2.Game>? games,
  }) : super._(
          id: id,
          userId: userId,
          name: name,
          games: games,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    int? userId,
    String? name,
    Object? games = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      games: games is List<_i2.Game>?
          ? games
          : this.games?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
