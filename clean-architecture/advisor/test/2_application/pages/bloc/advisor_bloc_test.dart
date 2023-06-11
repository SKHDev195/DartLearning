import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:advisor/2_application/pages/advice/bloc/advisor_bloc.dart';

void main() {
  group('AdvisorBlock', () {
    group('should emit', () {
      blocTest<AdvisorBloc, AdvisorState>(
        'nothing when no event is added',
        build: () => AdvisorBloc(),
        expect: () => const <AdvisorState>[],
      );

      blocTest(
        '[AdvisorStateLoading, AdvisorStateError] when AdviceRequestedEvent is added',
        build: () => AdvisorBloc(),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        wait: const Duration(
          seconds: 3,
        ),
        expect: () => <AdvisorState>[
          AdvisorStateLoading(),
          AdvisorStateLoaded(advice: 'test'),
          AdvisorStateError(
            message: 'error message',
          )
        ],
      );
    });
  });
}
