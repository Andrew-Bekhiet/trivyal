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

abstract class LiveGame implements _i1.TableRow, _i1.ProtocolSerialization {
  LiveGame._({
    this.id,
    required this.pin,
    required this.gameId,
  });

  factory LiveGame({
    int? id,
    required int pin,
    required int gameId,
  }) = _LiveGameImpl;

  factory LiveGame.fromJson(Map<String, dynamic> jsonSerialization) {
    return LiveGame(
      id: jsonSerialization['id'] as int?,
      pin: jsonSerialization['pin'] as int,
      gameId: jsonSerialization['gameId'] as int,
    );
  }

  static final t = LiveGameTable();

  static const db = LiveGameRepository._();

  @override
  int? id;

  int pin;

  int gameId;

  @override
  _i1.Table get table => t;

  LiveGame copyWith({
    int? id,
    int? pin,
    int? gameId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pin': pin,
      'gameId': gameId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pin': pin,
      'gameId': gameId,
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
  }) : super._(
          id: id,
          pin: pin,
          gameId: gameId,
        );

  @override
  LiveGame copyWith({
    Object? id = _Undefined,
    int? pin,
    int? gameId,
  }) {
    return LiveGame(
      id: id is int? ? id : this.id,
      pin: pin ?? this.pin,
      gameId: gameId ?? this.gameId,
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
  }

  late final _i1.ColumnInt pin;

  late final _i1.ColumnInt gameId;

  @override
  List<_i1.Column> get columns => [
        id,
        pin,
        gameId,
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
