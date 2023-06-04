part of 'advisor_cubit.dart';

@immutable
abstract class AdvisorStateCubit extends Equatable {
  const AdvisorStateCubit();

  @override
  List<Object> get props => [];
}

class AdvisorInitial extends AdvisorStateCubit {}

class AdvisorStateLoading extends AdvisorStateCubit {}

class AdvisorStateLoaded extends AdvisorStateCubit {
  const AdvisorStateLoaded({
    required this.advice,
  });

  final String advice;

  @override
  List<Object> get props => [advice];
}

class AdvisorStateError extends AdvisorStateCubit {
  const AdvisorStateError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
