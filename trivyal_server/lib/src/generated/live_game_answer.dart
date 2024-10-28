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

abstract class LiveGameAnswer
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LiveGameAnswer._({
    required this.player,
    required this.answerId,
  });

  factory LiveGameAnswer({
    required String player,
    required int answerId,
  }) = _LiveGameAnswerImpl;

  factory LiveGameAnswer.fromJson(Map<String, dynamic> jsonSerialization) {
    return LiveGameAnswer(
      player: jsonSerialization['player'] as String,
      answerId: jsonSerialization['answerId'] as int,
    );
  }

  String player;

  int answerId;

  LiveGameAnswer copyWith({
    String? player,
    int? answerId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'player': player,
      'answerId': answerId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'player': player,
      'answerId': answerId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LiveGameAnswerImpl extends LiveGameAnswer {
  _LiveGameAnswerImpl({
    required String player,
    required int answerId,
  }) : super._(
          player: player,
          answerId: answerId,
        );

  @override
  LiveGameAnswer copyWith({
    String? player,
    int? answerId,
  }) {
    return LiveGameAnswer(
      player: player ?? this.player,
      answerId: answerId ?? this.answerId,
    );
  }
}
