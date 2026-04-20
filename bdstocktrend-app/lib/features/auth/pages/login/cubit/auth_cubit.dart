import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/change_password.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/change_password_params.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/update_profile.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/update_profile_params.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:bd_stock_trend/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._postLogin, this._updateProfile, this._changePassword)
      : super(const _Loading());

  final PostLogin _postLogin;
  final UpdateProfile _updateProfile;
  final ChangePassword _changePassword;

  bool? isPasswordHide = true;

  void showHidePassword() {
    emit(const _Init());
    isPasswordHide = !(isPasswordHide ?? false);
    emit(const _ShowHide());
  }

  Future<void> login(LoginParams params) async {
    emit(const _Loading());
    try {
      final data = await _postLogin.call(params);

      data.fold(
        (l) {
          if (l is ServerFailure) {
            emit(_Failure(l.message ?? ""));
          } else {
            emit(_Failure("An error occurred: ${l.toString()}"));
          }
        },
        (r) => emit(_Success("Welcome back ${r.username}")),
      );
    } catch (e) {
      emit(_Failure("An unexpected error occurred: ${e.toString()}"));
    }
  }

  Future<void> updateProfile(UpdateProfileParams params) async {
    emit(const _Loading());
    final data = await _updateProfile.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      },
      (r) => emit(const _Success("Profile updated successfully")),
    );
  }

  Future<void> changePassword(ChangePasswordParams params) async {
    emit(const _Loading());
    final data = await _changePassword.call(params);

    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      },
      (r) => emit(const _Success("Password changed successfully")),
    );
  }

  Future<void> logout() async {
    emit(const _Loading());
    isPasswordHide = true;
    await MainBoxMixin().logoutBox();
    emit(const _Success(null));
  }
}
