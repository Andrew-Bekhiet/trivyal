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
    required this.text,
    required this.color,
  });

  factory Choice({
    required String text,
    required int color,
  }) = _ChoiceImpl;

  factory Choice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Choice(
      text: jsonSerialization['text'] as String,
      color: jsonSerialization['color'] as int,
    );
  }

  String text;

  int color;

  Choice copyWith({
    String? text,
    int? color,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'color': color,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ChoiceImpl extends Choice {
  _ChoiceImpl({
    required String text,
    required int color,
  }) : super._(
          text: text,
          color: color,
        );

  @override
  Choice copyWith({
    String? text,
    int? color,
  }) {
    return Choice(
      text: text ?? this.text,
      color: color ?? this.color,
    );
  }
}
