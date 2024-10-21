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

abstract class Question implements _i1.SerializableModel {
  Question._({
    this.id,
    required this.gameId,
    this.game,
    required this.text,
    required this.choices,
    required this.correctChoice,
    required this.timeInSeconds,
  });

  factory Question({
    int? id,
    required int gameId,
    _i2.Game? game,
    required String text,
    required List<_i2.Choice> choices,
    required _i2.Choice correctChoice,
    required int timeInSeconds,
  }) = _QuestionImpl;

  factory Question.fromJson(Map<String, dynamic> jsonSerialization) {
    return Question(
      id: jsonSerialization['id'] as int?,
      gameId: jsonSerialization['gameId'] as int,
      game: jsonSerialization['game'] == null
          ? null
          : _i2.Game.fromJson(
              (jsonSerialization['game'] as Map<String, dynamic>)),
      text: jsonSerialization['text'] as String,
      choices: (jsonSerialization['choices'] as List)
          .map((e) => _i2.Choice.fromJson((e as Map<String, dynamic>)))
          .toList(),
      correctChoice: _i2.Choice.fromJson(
          (jsonSerialization['correctChoice'] as Map<String, dynamic>)),
      timeInSeconds: jsonSerialization['timeInSeconds'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gameId;

  _i2.Game? game;

  String text;

  List<_i2.Choice> choices;

  _i2.Choice correctChoice;

  int timeInSeconds;

  Question copyWith({
    int? id,
    int? gameId,
    _i2.Game? game,
    String? text,
    List<_i2.Choice>? choices,
    _i2.Choice? correctChoice,
    int? timeInSeconds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gameId': gameId,
      if (game != null) 'game': game?.toJson(),
      'text': text,
      'choices': choices.toJson(valueToJson: (v) => v.toJson()),
      'correctChoice': correctChoice.toJson(),
      'timeInSeconds': timeInSeconds,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required int gameId,
    _i2.Game? game,
    required String text,
    required List<_i2.Choice> choices,
    required _i2.Choice correctChoice,
    required int timeInSeconds,
  }) : super._(
          id: id,
          gameId: gameId,
          game: game,
          text: text,
          choices: choices,
          correctChoice: correctChoice,
          timeInSeconds: timeInSeconds,
        );

  @override
  Question copyWith({
    Object? id = _Undefined,
    int? gameId,
    Object? game = _Undefined,
    String? text,
    List<_i2.Choice>? choices,
    _i2.Choice? correctChoice,
    int? timeInSeconds,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      gameId: gameId ?? this.gameId,
      game: game is _i2.Game? ? game : this.game?.copyWith(),
      text: text ?? this.text,
      choices: choices ?? this.choices.map((e0) => e0.copyWith()).toList(),
      correctChoice: correctChoice ?? this.correctChoice.copyWith(),
      timeInSeconds: timeInSeconds ?? this.timeInSeconds,
    );
  }
}
