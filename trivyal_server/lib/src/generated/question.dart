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

  static final t = QuestionTable();

  static const db = QuestionRepository._();

  @override
  int? id;

  int gameId;

  String text;

  List<_i2.Choice> choices;

  int correctChoiceId;

  int timeInSeconds;

  int? _gamesQuestionsGamesId;

  @override
  _i1.Table get table => t;

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
      if (_gamesQuestionsGamesId != null)
        '_gamesQuestionsGamesId': _gamesQuestionsGamesId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gameId': gameId,
      'text': text,
      'choices': choices.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'correctChoiceId': correctChoiceId,
      'timeInSeconds': timeInSeconds,
    };
  }

  static QuestionInclude include() {
    return QuestionInclude._();
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

class QuestionImplicit extends _QuestionImpl {
  QuestionImplicit._({
    int? id,
    required int gameId,
    required String text,
    required List<_i2.Choice> choices,
    required int correctChoiceId,
    required int timeInSeconds,
    this.$_gamesQuestionsGamesId,
  }) : super(
          id: id,
          gameId: gameId,
          text: text,
          choices: choices,
          correctChoiceId: correctChoiceId,
          timeInSeconds: timeInSeconds,
        );

  factory QuestionImplicit(
    Question question, {
    int? $_gamesQuestionsGamesId,
  }) {
    return QuestionImplicit._(
      id: question.id,
      gameId: question.gameId,
      text: question.text,
      choices: question.choices,
      correctChoiceId: question.correctChoiceId,
      timeInSeconds: question.timeInSeconds,
      $_gamesQuestionsGamesId: $_gamesQuestionsGamesId,
    );
  }

  int? $_gamesQuestionsGamesId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({'_gamesQuestionsGamesId': $_gamesQuestionsGamesId});
    return jsonMap;
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
    correctChoiceId = _i1.ColumnInt(
      'correctChoiceId',
      this,
    );
    timeInSeconds = _i1.ColumnInt(
      'timeInSeconds',
      this,
    );
    $_gamesQuestionsGamesId = _i1.ColumnInt(
      '_gamesQuestionsGamesId',
      this,
    );
  }

  late final _i1.ColumnInt gameId;

  late final _i1.ColumnString text;

  late final _i1.ColumnSerializable choices;

  late final _i1.ColumnInt correctChoiceId;

  late final _i1.ColumnInt timeInSeconds;

  late final _i1.ColumnInt $_gamesQuestionsGamesId;

  @override
  List<_i1.Column> get columns => [
        id,
        gameId,
        text,
        choices,
        correctChoiceId,
        timeInSeconds,
        $_gamesQuestionsGamesId,
      ];
}

class QuestionInclude extends _i1.IncludeObject {
  QuestionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

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

  Future<List<Question>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
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
  }) async {
    return session.db.findFirstRow<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Question?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Question>(
      id,
      transaction: transaction ?? session.transaction,
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
