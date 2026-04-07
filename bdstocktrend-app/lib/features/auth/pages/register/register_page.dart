import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:bd_stock_trend/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Controller
  final _conEmail = TextEditingController();
  final _conUsername = TextEditingController();
  final _conName = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnUserName = FocusNode();
  final _fnName = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  /// Global key form
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();

              /// back to login page after register success
              context.pop();
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(Dimens.space24),
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        Images.icLogo,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SpacerV(value: 24),
                    Text(
                      "Create Account",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Palette.primary,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SpacerV(value: 8),
                    Text(
                      "Join BD Stock Trend to start tracking stocks",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Palette.subText,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SpacerV(value: 32),
                    TextF(
                      key: const Key("name"),
                      curFocusNode: _fnName,
                      nextFocusNode: _fnUserName,
                      textInputAction: TextInputAction.next,
                      controller: _conName,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.person_rounded,
                        color: Palette.primary,
                        size: 20,
                      ),
                      hintText: 'Full Name',
                      hint: "Name",
                    ),
                    TextF(
                      key: const Key("username"),
                      curFocusNode: _fnUserName,
                      nextFocusNode: _fnEmail,
                      textInputAction: TextInputAction.next,
                      controller: _conUsername,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.account_circle_rounded,
                        color: Palette.primary,
                        size: 20,
                      ),
                      hintText: 'Username',
                      hint: "Username",
                    ),
                    TextF(
                      key: const Key("email"),
                      curFocusNode: _fnEmail,
                      nextFocusNode: _fnPassword,
                      textInputAction: TextInputAction.next,
                      controller: _conEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.alternate_email_rounded,
                        color: Palette.primary,
                        size: 20,
                      ),
                      hintText: 'Email Address',
                      hint: "Email",
                      validator: (String? value) => value != null
                          ? (!value.isValidEmail()
                              ? Strings.of(context)?.errorInvalidEmail
                              : null)
                          : null,
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (_, state) {
                        return Column(
                          children: [
                            TextF(
                              key: const Key("password"),
                              curFocusNode: _fnPassword,
                              nextFocusNode: _fnPasswordRepeat,
                              textInputAction: TextInputAction.next,
                              controller: _conPassword,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Palette.primary,
                                size: 20,
                              ),
                              obscureText: context
                                      .read<RegisterCubit>()
                                      .isPasswordHide ??
                                  true,
                              hintText: 'Password',
                              maxLine: 1,
                              hint: "Password",
                              suffixIcon: IconButton(
                                onPressed: () => context
                                    .read<RegisterCubit>()
                                    .showHidePassword(),
                                icon: Icon(
                                  (context
                                              .read<RegisterCubit>()
                                              .isPasswordHide ??
                                          true)
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  color: Palette.subText,
                                ),
                              ),
                              validator: (String? value) => value != null
                                  ? (value.length < 6
                                      ? Strings.of(context)!.errorPasswordLength
                                      : null)
                                  : null,
                              semantic: "password",
                            ),
                            TextF(
                              key: const Key("repeat_password"),
                              curFocusNode: _fnPasswordRepeat,
                              textInputAction: TextInputAction.done,
                              controller: _conPasswordRepeat,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                Icons.lock_reset_rounded,
                                color: Palette.primary,
                                size: 20,
                              ),
                              obscureText: context
                                      .read<RegisterCubit>()
                                      .isPasswordRepeatHide ??
                                  true,
                              hintText: 'Confirm Password',
                              maxLine: 1,
                              hint: "Confirm Password",
                              suffixIcon: IconButton(
                                onPressed: () => context
                                    .read<RegisterCubit>()
                                    .showHidePasswordRepeat(),
                                icon: Icon(
                                  (context
                                              .read<RegisterCubit>()
                                              .isPasswordRepeatHide ??
                                          true)
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  color: Palette.subText,
                                ),
                              ),
                              validator: (String? value) => value != null
                                  ? (value != _conPassword.text
                                      ? Strings.of(context)
                                          ?.errorPasswordNotMatch
                                      : null)
                                  : null,
                              semantic: "repeat_password",
                            ),
                          ],
                        );
                      },
                    ),
                    const SpacerV(value: 32),
                    Button(
                      key: const Key("btn_register"),
                      title: Strings.of(context)!.register,
                      onPressed: () {
                        /// Validate form first
                        if (_keyForm.currentState?.validate() ?? false) {
                          context.read<RegisterCubit>().register(
                                RegisterParams(
                                  name: _conName.text,
                                  username: _conUsername.text,
                                  email: _conEmail.text,
                                  password: _conPassword.text,
                                ),
                              );
                        }
                      },
                    ),
                    const SpacerV(value: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Text(
                            "Login",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
