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

abstract class LiveGame implements _i1.SerializableModel {
  LiveGame._({
    this.id,
    required this.pin,
    required this.gameId,
    required this.players,
    required this.currentStatus,
    this.currentQuestion,
    this.currentQuestionIndex,
    this.currentQuestionShowTime,
    required this.currentResults,
    required this.playerAnswers,
    required this.playerAnswersTime,
  });

  factory LiveGame({
    int? id,
    required int pin,
    required int gameId,
    required List<String> players,
    required _i2.LiveGameStatus currentStatus,
    _i2.Question? currentQuestion,
    int? currentQuestionIndex,
    DateTime? currentQuestionShowTime,
    required Map<String, int> currentResults,
    required Map<String, int> playerAnswers,
    required Map<String, DateTime> playerAnswersTime,
  }) = _LiveGameImpl;

  factory LiveGame.fromJson(Map<String, dynamic> jsonSerialization) {
    return LiveGame(
      id: jsonSerialization['id'] as int?,
      pin: jsonSerialization['pin'] as int,
      gameId: jsonSerialization['gameId'] as int,
      players: (jsonSerialization['players'] as List)
          .map((e) => e as String)
          .toList(),
      currentStatus: _i2.LiveGameStatus.fromJson(
          (jsonSerialization['currentStatus'] as String)),
      currentQuestion: jsonSerialization['currentQuestion'] == null
          ? null
          : _i2.Question.fromJson(
              (jsonSerialization['currentQuestion'] as Map<String, dynamic>)),
      currentQuestionIndex: jsonSerialization['currentQuestionIndex'] as int?,
      currentQuestionShowTime:
          jsonSerialization['currentQuestionShowTime'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['currentQuestionShowTime']),
      currentResults:
          (jsonSerialization['currentResults'] as Map).map((k, v) => MapEntry(
                k as String,
                v as int,
              )),
      playerAnswers:
          (jsonSerialization['playerAnswers'] as Map).map((k, v) => MapEntry(
                k as String,
                v as int,
              )),
      playerAnswersTime: (jsonSerialization['playerAnswersTime'] as Map)
          .map((k, v) => MapEntry(
                k as String,
                _i1.DateTimeJsonExtension.fromJson(v),
              )),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pin;

  int gameId;

  List<String> players;

  _i2.LiveGameStatus currentStatus;

  _i2.Question? currentQuestion;

  int? currentQuestionIndex;

  DateTime? currentQuestionShowTime;

  Map<String, int> currentResults;

  Map<String, int> playerAnswers;

  Map<String, DateTime> playerAnswersTime;

  LiveGame copyWith({
    int? id,
    int? pin,
    int? gameId,
    List<String>? players,
    _i2.LiveGameStatus? currentStatus,
    _i2.Question? currentQuestion,
    int? currentQuestionIndex,
    DateTime? currentQuestionShowTime,
    Map<String, int>? currentResults,
    Map<String, int>? playerAnswers,
    Map<String, DateTime>? playerAnswersTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pin': pin,
      'gameId': gameId,
      'players': players.toJson(),
      'currentStatus': currentStatus.toJson(),
      if (currentQuestion != null) 'currentQuestion': currentQuestion?.toJson(),
      if (currentQuestionIndex != null)
        'currentQuestionIndex': currentQuestionIndex,
      if (currentQuestionShowTime != null)
        'currentQuestionShowTime': currentQuestionShowTime?.toJson(),
      'currentResults': currentResults.toJson(),
      'playerAnswers': playerAnswers.toJson(),
      'playerAnswersTime':
          playerAnswersTime.toJson(valueToJson: (v) => v.toJson()),
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
    required List<String> players,
    required _i2.LiveGameStatus currentStatus,
    _i2.Question? currentQuestion,
    int? currentQuestionIndex,
    DateTime? currentQuestionShowTime,
    required Map<String, int> currentResults,
    required Map<String, int> playerAnswers,
    required Map<String, DateTime> playerAnswersTime,
  }) : super._(
          id: id,
          pin: pin,
          gameId: gameId,
          players: players,
          currentStatus: currentStatus,
          currentQuestion: currentQuestion,
          currentQuestionIndex: currentQuestionIndex,
          currentQuestionShowTime: currentQuestionShowTime,
          currentResults: currentResults,
          playerAnswers: playerAnswers,
          playerAnswersTime: playerAnswersTime,
        );

  @override
  LiveGame copyWith({
    Object? id = _Undefined,
    int? pin,
    int? gameId,
    List<String>? players,
    _i2.LiveGameStatus? currentStatus,
    Object? currentQuestion = _Undefined,
    Object? currentQuestionIndex = _Undefined,
    Object? currentQuestionShowTime = _Undefined,
    Map<String, int>? currentResults,
    Map<String, int>? playerAnswers,
    Map<String, DateTime>? playerAnswersTime,
  }) {
    return LiveGame(
      id: id is int? ? id : this.id,
      pin: pin ?? this.pin,
      gameId: gameId ?? this.gameId,
      players: players ?? this.players.map((e0) => e0).toList(),
      currentStatus: currentStatus ?? this.currentStatus,
      currentQuestion: currentQuestion is _i2.Question?
          ? currentQuestion
          : this.currentQuestion?.copyWith(),
      currentQuestionIndex: currentQuestionIndex is int?
          ? currentQuestionIndex
          : this.currentQuestionIndex,
      currentQuestionShowTime: currentQuestionShowTime is DateTime?
          ? currentQuestionShowTime
          : this.currentQuestionShowTime,
      currentResults: currentResults ??
          this.currentResults.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      playerAnswers: playerAnswers ??
          this.playerAnswers.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      playerAnswersTime: playerAnswersTime ??
          this.playerAnswersTime.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}
