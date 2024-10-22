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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'protocol.dart' as _i3;

abstract class Game implements _i1.SerializableModel {
  Game._({
    this.id,
    required this.name,
    required this.ownerId,
    this.owner,
    this.questions,
  });

  factory Game({
    int? id,
    required String name,
    required int ownerId,
    _i2.UserInfo? owner,
    List<_i3.Question>? questions,
  }) = _GameImpl;

  factory Game.fromJson(Map<String, dynamic> jsonSerialization) {
    return Game(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      questions: (jsonSerialization['questions'] as List?)
          ?.map((e) => _i3.Question.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int ownerId;

  _i2.UserInfo? owner;

  List<_i3.Question>? questions;

  Game copyWith({
    int? id,
    String? name,
    int? ownerId,
    _i2.UserInfo? owner,
    List<_i3.Question>? questions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (questions != null)
        'questions': questions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameImpl extends Game {
  _GameImpl({
    int? id,
    required String name,
    required int ownerId,
    _i2.UserInfo? owner,
    List<_i3.Question>? questions,
  }) : super._(
          id: id,
          name: name,
          ownerId: ownerId,
          owner: owner,
          questions: questions,
        );

  @override
  Game copyWith({
    Object? id = _Undefined,
    String? name,
    int? ownerId,
    Object? owner = _Undefined,
    Object? questions = _Undefined,
  }) {
    return Game(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.UserInfo? ? owner : this.owner?.copyWith(),
      questions: questions is List<_i3.Question>?
          ? questions
          : this.questions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
