// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:advisor/0_data/repositories/advice_repo_impl.dart';
import 'package:advisor/1_domain/entities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final AdviceRepoImpl adviceRepo;
  AdviceUseCases({
    required this.adviceRepo,
  });

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
