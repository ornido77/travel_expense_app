import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../core/network/api_client.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  if (getIt.isRegistered<ApiClient>()) {
    return;
  }

  getIt.registerLazySingleton<http.Client>(http.Client.new);
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(getIt<http.Client>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton<Login>(
    () => Login(getIt<AuthRepository>()),
  );
}
