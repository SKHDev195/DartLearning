import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advisor_event.dart';
part 'advisor_state.dart';

class AdvisorBloc extends Bloc<AdvisorEvent, AdvisorState> {
  AdvisorBloc() : super(AdvisorInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvisorStateLoading());
      // TODO: get advice here
      debugPrint('fake advice triggered');
      await Future.delayed(
        const Duration(seconds: 3),
        () {},
      );
      debugPrint('got advice');
      emit(AdvisorStateLoaded(advice: 'fake advice'));
      emit(AdvisorStateError(message: 'error message'));
    });
  }
}
