import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({
    required String advice,
    required int adviceId,
  }) : super(
          advice: advice,
          adviceId: adviceId,
        );

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      advice: json['advice'],
      adviceId: json['advice_id'],
    );
  }
}
