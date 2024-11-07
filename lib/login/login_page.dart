import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/utils/app_size.dart';
import 'package:flutter_task_manager/utils/extensions.dart';
import 'package:flutter_task_manager/utils/theme.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Create an Account',
                  style: context.bodyMedium()?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Palette.textColorSecondary,
                      ),
                ),
              )
            ],
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log In',
                    style: context.headlineLarge(),
                  ),
                  AppSize.size8.gap(),
                  Text(
                    'What' 's your email?',
                    style: context.labelMedium()?.copyWith(color: Palette.textColorSecondary, fontSize: AppSize.size16),
                  ),
                  AppSize.size32.gap(),
                  Text('Your Email',
                      style: context.labelLarge()?.copyWith(
                            color: Palette.textColorSecondary,
                          )),
                  AppSize.size8.gap(),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelStyle: context.labelLarge(),
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                  AppSize.size56.gap(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.size14),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: AppSize.size18),
                      ),
                      child: Text(
                        'Continue',
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
