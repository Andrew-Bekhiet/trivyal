/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'choice.dart' as _i4;
import 'game.dart' as _i5;
import 'game_list_response.dart' as _i6;
import 'live_game.dart' as _i7;
import 'question.dart' as _i8;
import 'protocol.dart' as _i9;
export 'choice.dart';
export 'game.dart';
export 'game_list_response.dart';
export 'live_game.dart';
export 'question.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'games',
      dartName: 'Game',
      schema: 'public',
      module: 'trivyal',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'games_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'games_fk_0',
          columns: ['ownerId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'games_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'live_games',
      dartName: 'LiveGame',
      schema: 'public',
      module: 'trivyal',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'live_games_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pin',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'gameId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'live_games_fk_0',
          columns: ['gameId'],
          referenceTable: 'games',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'live_games_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'pin_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'pin',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'gameId_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'gameId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'questions',
      dartName: 'Question',
      schema: 'public',
      module: 'trivyal',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'questions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gameId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'choices',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:Choice>',
        ),
        _i2.ColumnDefinition(
          name: 'correctChoiceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'timeInSeconds',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'questions_fk_0',
          columns: ['gameId'],
          referenceTable: 'games',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'questions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Choice) {
      return _i4.Choice.fromJson(data) as T;
    }
    if (t == _i5.Game) {
      return _i5.Game.fromJson(data) as T;
    }
    if (t == _i6.GameListResponse) {
      return _i6.GameListResponse.fromJson(data) as T;
    }
    if (t == _i7.LiveGame) {
      return _i7.LiveGame.fromJson(data) as T;
    }
    if (t == _i8.Question) {
      return _i8.Question.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Choice?>()) {
      return (data != null ? _i4.Choice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Game?>()) {
      return (data != null ? _i5.Game.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GameListResponse?>()) {
      return (data != null ? _i6.GameListResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LiveGame?>()) {
      return (data != null ? _i7.LiveGame.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Question?>()) {
      return (data != null ? _i8.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i9.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i9.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i9.Game>) {
      return (data as List).map((e) => deserialize<_i9.Game>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.Choice>) {
      return (data as List).map((e) => deserialize<_i9.Choice>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Choice) {
      return 'Choice';
    }
    if (data is _i5.Game) {
      return 'Game';
    }
    if (data is _i6.GameListResponse) {
      return 'GameListResponse';
    }
    if (data is _i7.LiveGame) {
      return 'LiveGame';
    }
    if (data is _i8.Question) {
      return 'Question';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Choice') {
      return deserialize<_i4.Choice>(data['data']);
    }
    if (data['className'] == 'Game') {
      return deserialize<_i5.Game>(data['data']);
    }
    if (data['className'] == 'GameListResponse') {
      return deserialize<_i6.GameListResponse>(data['data']);
    }
    if (data['className'] == 'LiveGame') {
      return deserialize<_i7.LiveGame>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i8.Question>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Game:
        return _i5.Game.t;
      case _i7.LiveGame:
        return _i7.LiveGame.t;
      case _i8.Question:
        return _i8.Question.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'trivyal';
}
