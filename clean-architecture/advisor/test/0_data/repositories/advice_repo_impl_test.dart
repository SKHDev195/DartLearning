import 'dart:io';

import 'package:advisor/0_data/datasources/advice_remote_datasource.dart';
import 'package:advisor/0_data/exceptions/exceptions.dart';
import 'package:advisor/0_data/models/advice_model.dart';
import 'package:advisor/0_data/repositories/advice_repo_impl.dart';
import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'advice_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDatasourceImpl>()])
void main() {
  final mockAdviceDatasource = MockAdviceRemoteDatasourceImpl();
  final adviceRepoImplTest =
      AdviceRepoImpl(adviceRemoteDatasource: mockAdviceDatasource);
  group('AdviceRepoImpl', () {
    group('should return an AdviceEntity', () {
      test('when AdviceRemoteDatasource returns an AdviceModel', () async {
        when(mockAdviceDatasource.getRandomAdviceFromApi()).thenAnswer(
          (realInvocation) =>
              Future.value(AdviceModel(advice: 'test', adviceId: 42)),
        );

        final result = await adviceRepoImplTest.getAdviceFromDataSource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(
          result,
          Right<Failure, AdviceModel>(
              AdviceModel(advice: 'test', adviceId: 42)),
        );

        verify(mockAdviceDatasource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceDatasource);
      });
    });

    group('should return left with', () {
      test('a ServerFailure when a ServerException occurs', () async {
        final mockAdviceDatasource = MockAdviceRemoteDatasourceImpl();
        final adviceRepoImplTest =
            AdviceRepoImpl(adviceRemoteDatasource: mockAdviceDatasource);

        when(mockAdviceDatasource.getRandomAdviceFromApi())
            .thenThrow(ServerException());

        final result = await adviceRepoImplTest.getAdviceFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
      });

      test('a GeneralFailure on all other Exceptions', () async {
        final mockAdviceDatasource = MockAdviceRemoteDatasourceImpl();
        final adviceRepoImplTest =
            AdviceRepoImpl(adviceRemoteDatasource: mockAdviceDatasource);

        when(mockAdviceDatasource.getRandomAdviceFromApi())
            .thenThrow(const SocketException('test'));

        final result = await adviceRepoImplTest.getAdviceFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
      });
    });
  });
}
