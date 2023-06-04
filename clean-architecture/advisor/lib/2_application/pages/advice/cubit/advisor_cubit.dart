import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:advisor/1_domain/usecases/advice_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'advisor_state.dart';

const String apiFailureMessage = 'API error, please try again';

const String cacheFailureMessage = 'Something went wrong, please try again';

const String generalFailureMessage = 'An error has occured, please try again';

class AdvisorCubit extends Cubit<AdvisorStateCubit> {
  AdvisorCubit() : super(AdvisorInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();

  Future<void> adviceRequested() async {
    emit(AdvisorStateLoading());
    final failureOrAdvice = await adviceUseCases.getAdvice();

    failureOrAdvice.fold(
      (failure) => emit(
        AdvisorStateError(message: _mapFailureToMessage(failure)),
      ),
      (advice) => emit(
        AdvisorStateLoaded(advice: advice.advice),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return apiFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
