import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/di/injection.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<User?> build() {
    return null;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final result = await getIt<Login>()(
      email: email,
      password: password,
    );

    state = result.fold(
      (failure) => AsyncError(
        failure.message,
        StackTrace.current,
      ),
      AsyncData.new,
    );
  }

  void logout() {
    state = const AsyncData(null);
  }
}
