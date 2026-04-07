import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/auth/auth.dart';
import 'package:bd_stock_trend/features/auth/domain/usecases/change_password_params.dart';
import 'package:bd_stock_trend/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _conOldPassword = TextEditingController();
  final _conNewPassword = TextEditingController();
  final _conConfirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text("Change Password"),
          centerTitle: true,
        ),
      ),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              context.showSnackBar("Password changed successfully");
              context.pop();
            },
            failure: (message) {
              context.dismiss();
              context.showSnackBar(message);
            },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimens.space24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextF(
                  controller: _conOldPassword,
                  key: const Key("old_password"),
                  hint: "Old Password",
                  hintText: "Enter old password",
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter old password";
                    }
                    return null;
                  },
                ),
                const SpacerV(value: 24),
                TextF(
                  controller: _conNewPassword,
                  key: const Key("new_password"),
                  hint: "New Password",
                  hintText: "Enter new password",
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter new password";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SpacerV(value: 24),
                TextF(
                  controller: _conConfirmPassword,
                  key: const Key("confirm_password"),
                  hint: "Confirm Password",
                  hintText: "Confirm new password",
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm password";
                    }
                    if (value != _conNewPassword.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                const SpacerV(value: 24),
                Button(
                  title: "Change Password",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<AuthCubit>().changePassword(
                            ChangePasswordParams(
                              oldPassword: _conOldPassword.text,
                              newPassword: _conNewPassword.text,
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
