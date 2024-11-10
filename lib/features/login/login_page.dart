import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/application/router/router.dart';
import 'package:flutter_task_manager/features/login/provider/login_provider.dart';
import 'package:flutter_task_manager/features/login/provider/login_state.dart';
import 'package:flutter_task_manager/utils/app_size.dart';
import 'package:flutter_task_manager/utils/extensions.dart';
import 'package:flutter_task_manager/utils/logger.dart';
import 'package:flutter_task_manager/utils/theme.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginControllerProvider, (prev, next) {
      LogUtils.getInstance.d('prev: $prev, next: $next');
      if (next is AsyncLoading) {
        showLoadingDialog(context);
      }
      if (next is AsyncData && next.value is LoginStateSuccess) {
        hideLoadingDialog(context);
        context.pushReplacement(AppRoute.taskPage.getPath());
      }
    });
    return Scaffold(
      backgroundColor: context.getColorScheme().onSurface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.getColorScheme().onSurface,
            surfaceTintColor: context.getColorScheme().onSurface,
            pinned: false,
            stretch: true,
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  context.getLocaleDelegate().createAccount,
                  style: context.bodyMedium()?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Palette.textColorSecondary,
                      ),
                ),
              )
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.getLocaleDelegate().logIn,
                    style: context.headlineLarge(),
                  ),
                  AppSize.size8.gap(),
                  Text(
                    context.getLocaleDelegate().whatsYourEmail,
                    style: context.labelMedium()?.copyWith(
                        color: Palette.textColorSecondary,
                        fontSize: AppSize.size16),
                  ),
                  AppSize.size32.gap(),
                  Text(context.getLocaleDelegate().yourEmail,
                      style: context.labelLarge()?.copyWith(
                            color: Palette.textColorSecondary,
                          )),
                  AppSize.size8.gap(),
                  Consumer(builder: (context, ref, child) {
                    String? textError;
                    var state = ref.watch(loginControllerProvider).asData;
                    if (state != null &&
                        state.value is LoginStateError &&
                        (state.value as LoginStateError).errorType ==
                            ErrorLoginType.EMAIL) {
                      textError = (state.value as LoginStateError).message;
                    }
                    return TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: context.getLocaleDelegate().email,
                        hintStyle: context
                            .getTextTheme()
                            .labelSmall
                            ?.copyWith(color: Palette.textColorSecondary),
                        labelStyle: context.labelLarge(),
                        border: const UnderlineInputBorder(),
                        errorText: textError,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    );
                  }),
                  AppSize.size16.gap(),
                  Text(context.getLocaleDelegate().yourPassword,
                      style: context.labelLarge()?.copyWith(
                            color: Palette.textColorSecondary,
                          )),
                  AppSize.size8.gap(),
                  Consumer(builder: (context, ref, child) {
                    String? textError;
                    var state = ref.watch(loginControllerProvider).asData;
                    if (state != null &&
                        state.value is LoginStateError &&
                        (state.value as LoginStateError).errorType ==
                            ErrorLoginType.PASSWORD) {
                      textError = (state.value as LoginStateError).message;
                    }
                    return TextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorText: textError,
                        hintText: context.getLocaleDelegate().password,
                        hintStyle: context
                            .getTextTheme()
                            .labelSmall
                            ?.copyWith(color: Palette.textColorSecondary),
                        labelStyle: context.labelLarge(),
                        border: const UnderlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.done,
                    );
                  }),
                  AppSize.size56.gap(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(loginControllerProvider.notifier).login(
                            email: _emailController.text,
                            password: _passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent, // Background color
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.size14),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: AppSize.size20),
                      ),
                      child: Text(
                        context.getLocaleDelegate().textContinue,
                        style: context.headlineSmall()?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
