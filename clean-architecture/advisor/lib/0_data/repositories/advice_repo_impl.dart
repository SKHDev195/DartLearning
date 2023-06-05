// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:advisor/0_data/datasources/advice_remote_datasource.dart';
import 'package:advisor/0_data/exceptions/exceptions.dart';
import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:advisor/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource;
  AdviceRepoImpl({
    required this.adviceRemoteDatasource,
  });

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
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
