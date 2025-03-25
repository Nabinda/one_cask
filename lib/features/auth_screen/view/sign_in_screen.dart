import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pixelfield/app_routes/app_routes.gr.dart';
import 'package:pixelfield/features/components/buttons/custom_filled_button.dart';
import 'package:pixelfield/features/components/form_fields/custom_text_field.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Palette.darkGreen21,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(96.h),
              Text(
                'Sign in',
                style: AppTextStyle.headlineLarge
                    .copyWith(color: Palette.greyEA)
                    .garamondFont,
              ),
              Gap(32.h),
              CustomTextField(
                labelText: 'Email',
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
              ),
              Gap(24.h),
              CustomTextField(
                labelText: 'Password',
                isPassword: true,
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
              ),
              Gap(40.h),
              CustomFilledButton(
                  label: 'Continue',
                  onTap: () {
                    context.router.replaceAll([DashboardScreen()]);
                  }),
              Gap(40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Can\'t sign in?',
                    style:
                        AppTextStyle.lato16400.copyWith(color: Palette.greyBF),
                  ),
                  Gap(8.w),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
                            .r,
                    child: Text(
                      'Recover password',
                      style: AppTextStyle.buttonLarge
                          .copyWith(color: Palette.orange01)
                          .garamondFont,
                    ),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
