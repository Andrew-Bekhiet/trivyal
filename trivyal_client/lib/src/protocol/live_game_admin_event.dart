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

enum LiveGameAdminEvent implements _i1.SerializableModel {
  startGame,
  showPodium,
  nextQuestion;

  static LiveGameAdminEvent fromJson(String name) {
    switch (name) {
      case 'startGame':
        return startGame;
      case 'showPodium':
        return showPodium;
      case 'nextQuestion':
        return nextQuestion;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "LiveGameAdminEvent"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
