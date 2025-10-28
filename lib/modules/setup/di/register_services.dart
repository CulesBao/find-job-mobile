import 'package:get_it/get_it.dart';
import '../services/candidate_profile_service.dart';

void registerSetupServices(GetIt getIt) {
  getIt.registerLazySingleton<ProfileSetupService>(() => ProfileSetupService());
}
