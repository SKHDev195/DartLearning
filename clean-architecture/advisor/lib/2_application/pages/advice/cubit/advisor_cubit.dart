import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advisor_state.dart';

class AdvisorCubit extends Cubit<AdvisorStateCubit> {
  AdvisorCubit() : super(AdvisorInitial());

  Future<void> adviceRequested() async {
    emit(AdvisorStateLoading());
    // TODO: get advice here

    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );

    emit(const AdvisorStateLoaded(advice: 'fake advice'));
    //emit(const AdvisorStateError(message: 'error message'));
  }
}
