import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/dependencies_injection.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/change_password.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/update_profile.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../../helpers/fake_path_provider_platform.dart';
import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';
import 'auth_cubit_test.mocks.dart';

@GenerateMocks([PostLogin, UpdateProfile, ChangePassword])
void main() {
  late AuthCubit authCubit;
  late Login login;
  late MockPostLogin mockPostLogin;
  late MockUpdateProfile mockUpdateProfile;
  late MockChangePassword mockChangePassword;

  const loginParams = LoginParams(
    email: "dummy@gmail.com",
    password: "dummyPassword",
  );
  const errorMessage = "Wrong username or password";

  /// Initialize data
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'auth_cubit_test_');
    login = (LoginResponse.fromJson(
      json.decode(jsonReader(successLoginPath)) as Map<String, dynamic>,
    )).toEntity();
    // Fixed potential null/cast issue from previous view?
    // Actually reusing existing code structure mostly.

    mockPostLogin = MockPostLogin();
    mockUpdateProfile = MockUpdateProfile();
    mockChangePassword = MockChangePassword();
    authCubit = AuthCubit(mockPostLogin, mockUpdateProfile, mockChangePassword);
  });

  /// Dispose bloc
  tearDown(() {
    authCubit.close();
  });

  ///  Initial data should be loading
  test("Initial data should be AuthStatus.loading", () {
    expect(authCubit.state, const AuthState.loading());
  });

  blocTest<AuthCubit, AuthState>(
    "When repo success get data should be return AuthState",
    build: () {
      when(mockPostLogin.call(loginParams))
          .thenAnswer((_) async => Right(login));

      return authCubit;
    },
    act: (cubit) => cubit.login(loginParams),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const AuthState.loading(),
      AuthState.success(login.token),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    "When user input wrong credential should be return ServerFailure",
    build: () {
      when(mockPostLogin.call(loginParams))
          .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return authCubit;
    },
    act: (AuthCubit authCubit) => authCubit.login(loginParams),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      AuthState.loading(),
      AuthState.failure(errorMessage),
    ],
  );
}

class MockUpdateProfile extends Mock implements UpdateProfile {}

class MockChangePassword extends Mock implements ChangePassword {}
