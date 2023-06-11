import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:advisor/1_domain/usecases/advice_usecase.dart';
import 'package:advisor/2_application/pages/advice/cubit/advisor_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceUseCases extends Mock implements AdviceUseCases {}

void main() {
  MockAdviceUseCases mockAdviceUseCases = MockAdviceUseCases();
  group('AdvisorCubit', () {
    group('should emit', () {
      blocTest('nothing when no method is called',
          build: (() => AdvisorCubit(adviceUseCases: mockAdviceUseCases)),
          expect: () => const <AdvisorStateCubit>[]);

      blocTest(
          '[AdvisorStateLoading, AdvisorStateLoaded] when adviceRequested() is called',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
                (invocation) => Future.value(
                  Right<Failure, AdviceEntity>(
                    AdviceEntity(
                      advice: 'advice',
                      adviceId: 1,
                    ),
                  ),
                ),
              ),
          build: (() => AdvisorCubit(adviceUseCases: mockAdviceUseCases)),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => const <AdvisorStateCubit>[
                AdvisorStateLoading(),
                AdvisorStateLoaded(advice: 'advice'),
              ]);
    });

    group(
        '[AdvisorStateLoading, AdvisorStateError] when adviceRquested() is called',
        () {
      blocTest(
        'and a ServerFailure occurs',
        setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
          (invocation) => Future.value(
            Left<Failure, AdviceEntity>(ServerFailure()),
          ),
        ),
        build: () => AdvisorCubit(adviceUseCases: mockAdviceUseCases),
        act: (cubit) => cubit.adviceRequested(),
        expect: () => const <AdvisorStateCubit>[
          AdvisorStateLoading(),
          AdvisorStateError(
            message: apiFailureMessage,
          ),
        ],
      );
      blocTest(
        'and a CacheFailure occurs',
        setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
          (invocation) => Future.value(
            Left<Failure, AdviceEntity>(CacheFailure()),
          ),
        ),
        build: () => AdvisorCubit(adviceUseCases: mockAdviceUseCases),
        act: (cubit) => cubit.adviceRequested(),
        expect: () => const <AdvisorStateCubit>[
          AdvisorStateLoading(),
          AdvisorStateError(
            message: cacheFailureMessage,
          ),
        ],
      );

      blocTest(
        'and a GeneralFailure occurs',
        setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
          (invocation) => Future.value(
            Left<Failure, AdviceEntity>(GeneralFailure()),
          ),
        ),
        build: () => AdvisorCubit(adviceUseCases: mockAdviceUseCases),
        act: (cubit) => cubit.adviceRequested(),
        expect: () => const <AdvisorStateCubit>[
          AdvisorStateLoading(),
          AdvisorStateError(
            message: generalFailureMessage,
          ),
        ],
      );
    });
  });
}
