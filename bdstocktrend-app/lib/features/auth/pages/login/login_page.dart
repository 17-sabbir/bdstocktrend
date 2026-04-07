import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bd_stock_trend/core/core.dart';
import 'package:bd_stock_trend/features/features.dart';
import 'package:bd_stock_trend/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MainBoxMixin {
  /// Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();

  /// Global key
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              data.toString().toToastSuccess(context);
              TextInput.finishAutofillContext();

              context.goNamed(Routes.dashboard.name);
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
              child: AutofillGroup(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Image.asset(
                          Images.icLogo,
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const SpacerV(value: 32),
                      Text(
                        "Welcome Back",
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Palette.primary,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      const SpacerV(value: 8),
                      Text(
                        "Sign in to continue your stock analysis",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Palette.subText,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SpacerV(value: 40),
                      TextF(
                        autofillHints: const [AutofillHints.email],
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
                        hintText: "Email Address",
                        hint: "Email",
                        validator: (String? value) => value != null
                            ? (!value.isValidEmail()
                                ? Strings.of(context)?.errorInvalidEmail
                                : null)
                            : null,
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (_, state) {
                          return TextF(
                            autofillHints: const [AutofillHints.password],
                            key: const Key("password"),
                            curFocusNode: _fnPassword,
                            textInputAction: TextInputAction.done,
                            controller: _conPassword,
                            keyboardType: TextInputType.text,
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Palette.primary,
                              size: 20,
                            ),
                            obscureText:
                                context.read<AuthCubit>().isPasswordHide ??
                                    true,
                            hintText: 'Password',
                            maxLine: 1,
                            hint: "Password",
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  context.read<AuthCubit>().showHidePassword(),
                              icon: Icon(
                                (context.read<AuthCubit>().isPasswordHide ??
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
                          );
                        },
                      ),
                      const SpacerV(value: 32),
                      Button(
                        title: Strings.of(context)!.login,
                        onPressed: () {
                          if (_keyForm.currentState?.validate() ?? false) {
                            context.read<AuthCubit>().login(
                                  LoginParams(
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
                            "Don't have an account? ",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          GestureDetector(
                            onTap: () =>
                                context.pushNamed(Routes.register.name),
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
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
      ),
    );
  }
}
