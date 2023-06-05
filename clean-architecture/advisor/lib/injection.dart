import 'package:advisor/0_data/datasources/advice_remote_datasource.dart';
import 'package:advisor/0_data/repositories/advice_repo_impl.dart';
import 'package:advisor/1_domain/repositories/advice_repo.dart';
import 'package:advisor/1_domain/usecases/advice_usecase.dart';
import 'package:advisor/2_application/pages/advice/cubit/advisor_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl == Service Locator

Future<void> init() async {
// ! application Layer
  // Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => AdvisorCubit(adviceUseCases: sl()));

// ! domain Layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

// ! data Layer
  sl.registerFactory<AdviceRepoImpl>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

// ! externs
  sl.registerFactory(() => http.Client());
}
