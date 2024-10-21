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

abstract class User implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  int? id;

  int userId;

  String name;

  List<_i2.Game>? games;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
      if (games != null)
        'games': games?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static UserInclude include({_i2.GameIncludeList? games}) {
    return UserInclude._(games: games);
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
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

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'users') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString name;

  _i2.GameTable? ___games;

  _i1.ManyRelation<_i2.GameTable>? _games;

  _i2.GameTable get __games {
    if (___games != null) return ___games!;
    ___games = _i1.createRelationTable(
      relationFieldName: '__games',
      field: User.t.id,
      foreignField: _i2.Game.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GameTable(tableRelation: foreignTableRelation),
    );
    return ___games!;
  }

  _i1.ManyRelation<_i2.GameTable> get games {
    if (_games != null) return _games!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'games',
      field: User.t.id,
      foreignField: _i2.Game.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GameTable(tableRelation: foreignTableRelation),
    );
    _games = _i1.ManyRelation<_i2.GameTable>(
      tableWithRelations: relationTable,
      table: _i2.GameTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _games!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        name,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'games') {
      return __games;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({_i2.GameIncludeList? games}) {
    _games = games;
  }

  _i2.GameIncludeList? _games;

  @override
  Map<String, _i1.Include?> get includes => {'games': _games};

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  Future<void> games(
    _i1.Session session,
    User user,
    List<_i2.Game> game, {
    _i1.Transaction? transaction,
  }) async {
    if (game.any((e) => e.id == null)) {
      throw ArgumentError.notNull('game.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $game = game.map((e) => e.copyWith(ownerId: user.id)).toList();
    await session.db.update<_i2.Game>(
      $game,
      columns: [_i2.Game.t.ownerId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  Future<void> games(
    _i1.Session session,
    User user,
    _i2.Game game, {
    _i1.Transaction? transaction,
  }) async {
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $game = game.copyWith(ownerId: user.id);
    await session.db.updateRow<_i2.Game>(
      $game,
      columns: [_i2.Game.t.ownerId],
      transaction: transaction ?? session.transaction,
    );
  }
}
