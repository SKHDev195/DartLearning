part of 'advisor_bloc.dart';

@immutable
abstract class AdvisorState {}

class AdvisorInitial extends AdvisorState {}

class AdvisorStateLoading extends AdvisorState {}

class AdvisorStateLoaded extends AdvisorState {
  AdvisorStateLoaded({
    required this.advice,
  });

  final String advice;
}

class AdvisorStateError extends AdvisorState {
  AdvisorStateError({required this.message});

  final String message;
}
