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

abstract class Game implements _i1.TableRow, _i1.ProtocolSerialization {
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
    _i2.User? owner,
    List<_i2.Question>? questions,
  }) = _GameImpl;

  factory Game.fromJson(Map<String, dynamic> jsonSerialization) {
    return Game(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      questions: (jsonSerialization['questions'] as List?)
          ?.map((e) => _i2.Question.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = GameTable();

  static const db = GameRepository._();

  @override
  int? id;

  String name;

  int ownerId;

  _i2.User? owner;

  List<_i2.Question>? questions;

  @override
  _i1.Table get table => t;

  Game copyWith({
    int? id,
    String? name,
    int? ownerId,
    _i2.User? owner,
    List<_i2.Question>? questions,
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (questions != null)
        'questions':
            questions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static GameInclude include({
    _i2.UserInclude? owner,
    _i2.QuestionIncludeList? questions,
  }) {
    return GameInclude._(
      owner: owner,
      questions: questions,
    );
  }

  static GameIncludeList includeList({
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    GameInclude? include,
  }) {
    return GameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Game.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Game.t),
      include: include,
    );
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
    _i2.User? owner,
    List<_i2.Question>? questions,
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
      owner: owner is _i2.User? ? owner : this.owner?.copyWith(),
      questions: questions is List<_i2.Question>?
          ? questions
          : this.questions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class GameTable extends _i1.Table {
  GameTable({super.tableRelation}) : super(tableName: 'games') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt ownerId;

  _i2.UserTable? _owner;

  _i2.QuestionTable? ___questions;

  _i1.ManyRelation<_i2.QuestionTable>? _questions;

  _i2.UserTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Game.t.ownerId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i2.QuestionTable get __questions {
    if (___questions != null) return ___questions!;
    ___questions = _i1.createRelationTable(
      relationFieldName: '__questions',
      field: Game.t.id,
      foreignField: _i2.Question.t.gameId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    return ___questions!;
  }

  _i1.ManyRelation<_i2.QuestionTable> get questions {
    if (_questions != null) return _questions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'questions',
      field: Game.t.id,
      foreignField: _i2.Question.t.gameId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    _questions = _i1.ManyRelation<_i2.QuestionTable>(
      tableWithRelations: relationTable,
      table: _i2.QuestionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _questions!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        ownerId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'questions') {
      return __questions;
    }
    return null;
  }
}

class GameInclude extends _i1.IncludeObject {
  GameInclude._({
    _i2.UserInclude? owner,
    _i2.QuestionIncludeList? questions,
  }) {
    _owner = owner;
    _questions = questions;
  }

  _i2.UserInclude? _owner;

  _i2.QuestionIncludeList? _questions;

  @override
  Map<String, _i1.Include?> get includes => {
        'owner': _owner,
        'questions': _questions,
      };

  @override
  _i1.Table get table => Game.t;
}

class GameIncludeList extends _i1.IncludeList {
  GameIncludeList._({
    _i1.WhereExpressionBuilder<GameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Game.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Game.t;
}

class GameRepository {
  const GameRepository._();

  final attach = const GameAttachRepository._();

  final attachRow = const GameAttachRowRepository._();

  final detach = const GameDetachRepository._();

  final detachRow = const GameDetachRowRepository._();

  Future<List<Game>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    _i1.Transaction? transaction,
    GameInclude? include,
  }) async {
    return session.db.find<Game>(
      where: where?.call(Game.t),
      orderBy: orderBy?.call(Game.t),
      orderByList: orderByList?.call(Game.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Game?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    _i1.Transaction? transaction,
    GameInclude? include,
  }) async {
    return session.db.findFirstRow<Game>(
      where: where?.call(Game.t),
      orderBy: orderBy?.call(Game.t),
      orderByList: orderByList?.call(Game.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Game?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GameInclude? include,
  }) async {
    return session.db.findById<Game>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Game>> insert(
    _i1.Session session,
    List<Game> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Game>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Game> insertRow(
    _i1.Session session,
    Game row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Game>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Game>> update(
    _i1.Session session,
    List<Game> rows, {
    _i1.ColumnSelections<GameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Game>(
      rows,
      columns: columns?.call(Game.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Game> updateRow(
    _i1.Session session,
    Game row, {
    _i1.ColumnSelections<GameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Game>(
      row,
      columns: columns?.call(Game.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Game>> delete(
    _i1.Session session,
    List<Game> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Game>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Game> deleteRow(
    _i1.Session session,
    Game row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Game>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Game>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Game>(
      where: where(Game.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Game>(
      where: where?.call(Game.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class GameAttachRepository {
  const GameAttachRepository._();

  Future<void> questions(
    _i1.Session session,
    Game game,
    List<_i2.Question> question, {
    _i1.Transaction? transaction,
  }) async {
    if (question.any((e) => e.id == null)) {
      throw ArgumentError.notNull('question.id');
    }
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }

    var $question = question.map((e) => e.copyWith(gameId: game.id)).toList();
    await session.db.update<_i2.Question>(
      $question,
      columns: [_i2.Question.t.gameId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class GameAttachRowRepository {
  const GameAttachRowRepository._();

  Future<void> owner(
    _i1.Session session,
    Game game,
    _i2.User owner, {
    _i1.Transaction? transaction,
  }) async {
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $game = game.copyWith(ownerId: owner.id);
    await session.db.updateRow<Game>(
      $game,
      columns: [Game.t.ownerId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> questions(
    _i1.Session session,
    Game game,
    _i2.Question question, {
    _i1.Transaction? transaction,
  }) async {
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }

    var $question = question.copyWith(gameId: game.id);
    await session.db.updateRow<_i2.Question>(
      $question,
      columns: [_i2.Question.t.gameId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class GameDetachRepository {
  const GameDetachRepository._();

  Future<void> questions(
    _i1.Session session,
    List<_i2.Question> question, {
    _i1.Transaction? transaction,
  }) async {
    if (question.any((e) => e.id == null)) {
      throw ArgumentError.notNull('question.id');
    }

    var $question = question.map((e) => e.copyWith(gameId: null)).toList();
    await session.db.update<_i2.Question>(
      $question,
      columns: [_i2.Question.t.gameId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class GameDetachRowRepository {
  const GameDetachRowRepository._();

  Future<void> questions(
    _i1.Session session,
    _i2.Question question, {
    _i1.Transaction? transaction,
  }) async {
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $question = question.copyWith(gameId: null);
    await session.db.updateRow<_i2.Question>(
      $question,
      columns: [_i2.Question.t.gameId],
      transaction: transaction ?? session.transaction,
    );
  }
}
