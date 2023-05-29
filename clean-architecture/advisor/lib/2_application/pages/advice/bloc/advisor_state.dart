part of 'advisor_bloc.dart';

@immutable
abstract class AdvisorState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AdvisorInitial extends AdvisorState {}

class AdvisorStateLoading extends AdvisorState {}

class AdvisorStateLoaded extends AdvisorState {
  AdvisorStateLoaded({
    required this.advice,
  });

  final String advice;

  @override
  List<Object> get props => [advice];
}

class AdvisorStateError extends AdvisorState {
  AdvisorStateError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
