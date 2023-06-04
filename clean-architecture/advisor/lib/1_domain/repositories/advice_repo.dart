import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource();
}
