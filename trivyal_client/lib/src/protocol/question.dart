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
    required this.text,
    required this.choices,
    required this.correctChoiceId,
    required this.timeInSeconds,
  });

  factory Question({
    int? id,
    required int gameId,
    required String text,
    required List<_i2.Choice> choices,
    required int correctChoiceId,
    required int timeInSeconds,
  }) = _QuestionImpl;

  factory Question.fromJson(Map<String, dynamic> jsonSerialization) {
    return Question(
      id: jsonSerialization['id'] as int?,
      gameId: jsonSerialization['gameId'] as int,
      text: jsonSerialization['text'] as String,
      choices: (jsonSerialization['choices'] as List)
          .map((e) => _i2.Choice.fromJson((e as Map<String, dynamic>)))
          .toList(),
      correctChoiceId: jsonSerialization['correctChoiceId'] as int,
      timeInSeconds: jsonSerialization['timeInSeconds'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gameId;

  String text;

  List<_i2.Choice> choices;

  int correctChoiceId;

  int timeInSeconds;

  Question copyWith({
    int? id,
    int? gameId,
    String? text,
    List<_i2.Choice>? choices,
    int? correctChoiceId,
    int? timeInSeconds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gameId': gameId,
      'text': text,
      'choices': choices.toJson(valueToJson: (v) => v.toJson()),
      'correctChoiceId': correctChoiceId,
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
    required String text,
    required List<_i2.Choice> choices,
    required int correctChoiceId,
    required int timeInSeconds,
  }) : super._(
          id: id,
          gameId: gameId,
          text: text,
          choices: choices,
          correctChoiceId: correctChoiceId,
          timeInSeconds: timeInSeconds,
        );

  @override
  Question copyWith({
    Object? id = _Undefined,
    int? gameId,
    String? text,
    List<_i2.Choice>? choices,
    int? correctChoiceId,
    int? timeInSeconds,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      gameId: gameId ?? this.gameId,
      text: text ?? this.text,
      choices: choices ?? this.choices.map((e0) => e0.copyWith()).toList(),
      correctChoiceId: correctChoiceId ?? this.correctChoiceId,
      timeInSeconds: timeInSeconds ?? this.timeInSeconds,
    );
  }
}
