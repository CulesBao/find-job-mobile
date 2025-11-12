import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:find_job_mobile/shared/data/api/dio_client.dart';
import 'package:find_job_mobile/shared/data/api/auth_api_service.dart';
import 'package:find_job_mobile/shared/data/api/candidate_profile_api_service.dart';
import 'package:find_job_mobile/shared/data/api/employer_profile_api_service.dart';
import 'package:find_job_mobile/shared/data/api/location_api_service.dart';
import 'package:find_job_mobile/shared/data/api/chat_api_service.dart';
import 'package:find_job_mobile/shared/data/api/job_api_service.dart';
import 'package:find_job_mobile/shared/data/api/candidate_follower_api_service.dart';
import 'package:find_job_mobile/shared/data/api/employer_follower_api_service.dart';
import 'package:find_job_mobile/shared/data/repositories/auth_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_profile_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository_impl.dart';
import 'package:find_job_mobile/shared/data/repositories/location_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/chat_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/job_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_follower_repository.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_follower_repository.dart';
import 'package:find_job_mobile/modules/setup/di/register_services.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register setup module services
  registerSetupServices(getIt);

  // DioClient
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(prefs: getIt<SharedPreferences>()),
  );

  // API Services
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<CandidateProfileApiService>(
    () => CandidateProfileApiService(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<LocationApiService>(
    () => LocationApiService(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<EmployerProfileApiService>(
    () => EmployerProfileApiService(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<ChatApiService>(
    () => ChatApiService(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<JobApiService>(
    () => JobApiService(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<CandidateFollowerApiService>(
    () => CandidateFollowerApiService(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<EmployerFollowerApiService>(
    () => EmployerFollowerApiService(getIt<DioClient>().dio),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<AuthApiService>(), getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<CandidateProfileRepository>(
    () => CandidateProfileRepository(getIt<CandidateProfileApiService>()),
  );

  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepository(getIt<LocationApiService>()),
  );

  getIt.registerLazySingleton<EmployerProfileRepository>(
    () => EmployerProfileRepositoryImpl(getIt<EmployerProfileApiService>()),
  );

  getIt.registerLazySingleton<ChatRepository>(
    () => ChatRepository(getIt<ChatApiService>()),
  );

  getIt.registerLazySingleton<JobRepository>(
    () => JobRepository(getIt<JobApiService>()),
  );

  getIt.registerLazySingleton<CandidateFollowerRepository>(
    () => CandidateFollowerRepository(getIt<CandidateFollowerApiService>()),
  );

  getIt.registerLazySingleton<EmployerFollowerRepository>(
    () => EmployerFollowerRepository(getIt<EmployerFollowerApiService>()),
  );
}
