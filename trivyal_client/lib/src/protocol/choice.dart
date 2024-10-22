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

abstract class Choice implements _i1.SerializableModel {
  Choice._({
    required this.id,
    required this.text,
    this.color,
  });

  factory Choice({
    required int id,
    required String text,
    int? color,
  }) = _ChoiceImpl;

  factory Choice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Choice(
      id: jsonSerialization['id'] as int,
      text: jsonSerialization['text'] as String,
      color: jsonSerialization['color'] as int?,
    );
  }

  int id;

  String text;

  int? color;

  Choice copyWith({
    int? id,
    String? text,
    int? color,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      if (color != null) 'color': color,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChoiceImpl extends Choice {
  _ChoiceImpl({
    required int id,
    required String text,
    int? color,
  }) : super._(
          id: id,
          text: text,
          color: color,
        );

  @override
  Choice copyWith({
    int? id,
    String? text,
    Object? color = _Undefined,
  }) {
    return Choice(
      id: id ?? this.id,
      text: text ?? this.text,
      color: color is int? ? color : this.color,
    );
  }
}
