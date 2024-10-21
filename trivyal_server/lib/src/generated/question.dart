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

abstract class Question implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = QuestionTable();

  static const db = QuestionRepository._();

  @override
  int? id;

  int gameId;

  _i2.Game? game;

  String text;

  List<_i2.Choice> choices;

  _i2.Choice correctChoice;

  int timeInSeconds;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gameId': gameId,
      if (game != null) 'game': game?.toJsonForProtocol(),
      'text': text,
      'choices': choices.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'correctChoice': correctChoice.toJsonForProtocol(),
      'timeInSeconds': timeInSeconds,
    };
  }

  static QuestionInclude include({_i2.GameInclude? game}) {
    return QuestionInclude._(game: game);
  }

  static QuestionIncludeList includeList({
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    QuestionInclude? include,
  }) {
    return QuestionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Question.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Question.t),
      include: include,
    );
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

class QuestionTable extends _i1.Table {
  QuestionTable({super.tableRelation}) : super(tableName: 'questions') {
    gameId = _i1.ColumnInt(
      'gameId',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    choices = _i1.ColumnSerializable(
      'choices',
      this,
    );
    correctChoice = _i1.ColumnSerializable(
      'correctChoice',
      this,
    );
    timeInSeconds = _i1.ColumnInt(
      'timeInSeconds',
      this,
    );
  }

  late final _i1.ColumnInt gameId;

  _i2.GameTable? _game;

  late final _i1.ColumnString text;

  late final _i1.ColumnSerializable choices;

  late final _i1.ColumnSerializable correctChoice;

  late final _i1.ColumnInt timeInSeconds;

  _i2.GameTable get game {
    if (_game != null) return _game!;
    _game = _i1.createRelationTable(
      relationFieldName: 'game',
      field: Question.t.gameId,
      foreignField: _i2.Game.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GameTable(tableRelation: foreignTableRelation),
    );
    return _game!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        gameId,
        text,
        choices,
        correctChoice,
        timeInSeconds,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'game') {
      return game;
    }
    return null;
  }
}

class QuestionInclude extends _i1.IncludeObject {
  QuestionInclude._({_i2.GameInclude? game}) {
    _game = game;
  }

  _i2.GameInclude? _game;

  @override
  Map<String, _i1.Include?> get includes => {'game': _game};

  @override
  _i1.Table get table => Question.t;
}

class QuestionIncludeList extends _i1.IncludeList {
  QuestionIncludeList._({
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Question.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Question.t;
}

class QuestionRepository {
  const QuestionRepository._();

  final attachRow = const QuestionAttachRowRepository._();

  Future<List<Question>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.find<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Question?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.findFirstRow<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Question?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.findById<Question>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Question>> insert(
    _i1.Session session,
    List<Question> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Question>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Question> insertRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Question>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Question>> update(
    _i1.Session session,
    List<Question> rows, {
    _i1.ColumnSelections<QuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Question>(
      rows,
      columns: columns?.call(Question.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Question> updateRow(
    _i1.Session session,
    Question row, {
    _i1.ColumnSelections<QuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Question>(
      row,
      columns: columns?.call(Question.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Question>> delete(
    _i1.Session session,
    List<Question> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Question>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Question> deleteRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Question>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Question>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuestionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Question>(
      where: where(Question.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Question>(
      where: where?.call(Question.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class QuestionAttachRowRepository {
  const QuestionAttachRowRepository._();

  Future<void> game(
    _i1.Session session,
    Question question,
    _i2.Game game, {
    _i1.Transaction? transaction,
  }) async {
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }

    var $question = question.copyWith(gameId: game.id);
    await session.db.updateRow<Question>(
      $question,
      columns: [Question.t.gameId],
      transaction: transaction ?? session.transaction,
    );
  }
}
