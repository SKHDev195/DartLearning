import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  AdviceEntity({
    required this.advice,
    required this.adviceId,
  });

  final String advice;
  final int adviceId;

  @override
  List<Object?> get props => [
        advice,
        adviceId,
      ];
}
