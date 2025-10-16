import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PasswordchangeScreen extends StatelessWidget {
  const PasswordchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.accentcolor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.successSvg, width: 100, height: 100),
              Gap(35),
              const Text(
                "Password Changed!",
                style: TextStyle(
                  color: Appcolors.blackcolor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(3),
              const Text(
                "Your password has been changed successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Appcolors.grycolor),
              ),
              Gap(40),
              MainButton(
                text: "Back to Login",
                onPressed: () {
                  pushTo(context, Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
