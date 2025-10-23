import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:find_job_mobile/shared/data/api/dio_client.dart';
import 'package:find_job_mobile/shared/data/api/auth_api_service.dart';
import 'package:find_job_mobile/shared/data/repositories/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // DioClient
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(prefs: getIt<SharedPreferences>()),
  );

  // API Services
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<DioClient>().dio),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<AuthApiService>(), getIt<SharedPreferences>()),
  );
}
