import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/networking/api_service.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/networking/dio_factory.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signin/data/repos/loign_repo.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signin/logic/login_cubit/login_cubit.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signup/data/repos/signup_repo.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signup/logic/signup_cubit/signup_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
