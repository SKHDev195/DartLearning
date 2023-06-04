import 'package:advisor/0_data/datasources/advice_remote_datasource.dart';
import 'package:advisor/0_data/exceptions/exceptions.dart';
import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:advisor/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDataSource =
      AdviceRemoteDatasourceImpl();

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDataSource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure());
    } on CacheException catch (e) {
      return left(CacheFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
