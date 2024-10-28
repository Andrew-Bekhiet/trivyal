/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class LiveGame implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = LiveGameTable();

  static const db = LiveGameRepository._();

  @override
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

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pin': pin,
      'gameId': gameId,
      'players': players.toJson(),
      'currentStatus': currentStatus.toJson(),
      if (currentQuestion != null)
        'currentQuestion': currentQuestion?.toJsonForProtocol(),
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

  static LiveGameInclude include() {
    return LiveGameInclude._();
  }

  static LiveGameIncludeList includeList({
    _i1.WhereExpressionBuilder<LiveGameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LiveGameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LiveGameTable>? orderByList,
    LiveGameInclude? include,
  }) {
    return LiveGameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LiveGame.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LiveGame.t),
      include: include,
    );
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

class LiveGameTable extends _i1.Table {
  LiveGameTable({super.tableRelation}) : super(tableName: 'live_games') {
    pin = _i1.ColumnInt(
      'pin',
      this,
    );
    gameId = _i1.ColumnInt(
      'gameId',
      this,
    );
    players = _i1.ColumnSerializable(
      'players',
      this,
    );
    currentStatus = _i1.ColumnEnum(
      'currentStatus',
      this,
      _i1.EnumSerialization.byName,
    );
    currentQuestion = _i1.ColumnSerializable(
      'currentQuestion',
      this,
    );
    currentQuestionIndex = _i1.ColumnInt(
      'currentQuestionIndex',
      this,
    );
    currentQuestionShowTime = _i1.ColumnDateTime(
      'currentQuestionShowTime',
      this,
    );
    currentResults = _i1.ColumnSerializable(
      'currentResults',
      this,
    );
    playerAnswers = _i1.ColumnSerializable(
      'playerAnswers',
      this,
    );
    playerAnswersTime = _i1.ColumnSerializable(
      'playerAnswersTime',
      this,
    );
  }

  late final _i1.ColumnInt pin;

  late final _i1.ColumnInt gameId;

  late final _i1.ColumnSerializable players;

  late final _i1.ColumnEnum<_i2.LiveGameStatus> currentStatus;

  late final _i1.ColumnSerializable currentQuestion;

  late final _i1.ColumnInt currentQuestionIndex;

  late final _i1.ColumnDateTime currentQuestionShowTime;

  late final _i1.ColumnSerializable currentResults;

  late final _i1.ColumnSerializable playerAnswers;

  late final _i1.ColumnSerializable playerAnswersTime;

  @override
  List<_i1.Column> get columns => [
        id,
        pin,
        gameId,
        players,
        currentStatus,
        currentQuestion,
        currentQuestionIndex,
        currentQuestionShowTime,
        currentResults,
        playerAnswers,
        playerAnswersTime,
      ];
}

class LiveGameInclude extends _i1.IncludeObject {
  LiveGameInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => LiveGame.t;
}

class LiveGameIncludeList extends _i1.IncludeList {
  LiveGameIncludeList._({
    _i1.WhereExpressionBuilder<LiveGameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LiveGame.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => LiveGame.t;
}

class LiveGameRepository {
  const LiveGameRepository._();

  Future<List<LiveGame>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LiveGameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LiveGameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LiveGameTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LiveGame>(
      where: where?.call(LiveGame.t),
      orderBy: orderBy?.call(LiveGame.t),
      orderByList: orderByList?.call(LiveGame.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<LiveGame?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LiveGameTable>? where,
    int? offset,
    _i1.OrderByBuilder<LiveGameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LiveGameTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LiveGame>(
      where: where?.call(LiveGame.t),
      orderBy: orderBy?.call(LiveGame.t),
      orderByList: orderByList?.call(LiveGame.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<LiveGame?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LiveGame>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<LiveGame>> insert(
    _i1.Session session,
    List<LiveGame> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LiveGame>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<LiveGame> insertRow(
    _i1.Session session,
    LiveGame row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LiveGame>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<LiveGame>> update(
    _i1.Session session,
    List<LiveGame> rows, {
    _i1.ColumnSelections<LiveGameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LiveGame>(
      rows,
      columns: columns?.call(LiveGame.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<LiveGame> updateRow(
    _i1.Session session,
    LiveGame row, {
    _i1.ColumnSelections<LiveGameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LiveGame>(
      row,
      columns: columns?.call(LiveGame.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<LiveGame>> delete(
    _i1.Session session,
    List<LiveGame> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LiveGame>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<LiveGame> deleteRow(
    _i1.Session session,
    LiveGame row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LiveGame>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<LiveGame>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LiveGameTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LiveGame>(
      where: where(LiveGame.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LiveGameTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LiveGame>(
      where: where?.call(LiveGame.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
