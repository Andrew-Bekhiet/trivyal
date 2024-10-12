/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class User implements _i1.TableRow, _i1.ProtocolSerialization {
  User._({
    this.id,
    required this.userId,
    required this.name,
  });

  factory User({
    int? id,
    required int userId,
    required String name,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  int? id;

  int userId;

  String name;

  @override
  _i1.Table get table => t;

  User copyWith({
    int? id,
    int? userId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
    };
  }

  static UserInclude include() {
    return UserInclude._();
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
  }) : super._(
          id: id,
          userId: userId,
          name: name,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    int? userId,
    String? name,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
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

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        name,
      ];
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

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

  Future<List<User>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<User?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<User?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<User>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<User>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<User>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<User> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<User>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<User>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<User> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<User>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<User>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<User> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<User>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<User>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
