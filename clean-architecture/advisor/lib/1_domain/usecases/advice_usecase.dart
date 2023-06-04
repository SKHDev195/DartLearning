import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return right(
      AdviceEntity(
        advice: 'fake advice',
        adviceId: 28,
      ),
    );
    return left(ServerFailure());
  }
}
