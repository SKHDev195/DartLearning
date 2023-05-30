import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/usecases/advice_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advisor_state.dart';

class AdvisorCubit extends Cubit<AdvisorStateCubit> {
  AdvisorCubit() : super(AdvisorInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();

  Future<void> adviceRequested() async {
    emit(AdvisorStateLoading());
    final AdviceEntity advice = await adviceUseCases.getAdvice();

    emit(AdvisorStateLoaded(advice: advice.advice));
    //emit(const AdvisorStateError(message: 'error message'));
  }
}
