part of 'advisor_bloc.dart';

@immutable
abstract class AdvisorEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AdviceRequestedEvent extends AdvisorEvent {}
