import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/bottons/custom_text_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildForgetBody(),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Remember Password? ", style: TextStyles.styleSize14()),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.login);
            },
            child: Text(
              "Login",
              style: TextStyles.styleSize14(color: Appcolors.primarycolor),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildForgetBody() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Forgot Password?", style: TextStyles.styleSize30()),
            Gap(12),
            Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: TextStyles.styleSize16(color: Appcolors.grycolor),
            ),
            Gap(30),
            CustomTextField(
              controller: emailController,
              hint: "enter your email",
            ),
            Gap(30),

            MainButton(
              text: " send code",
              onPressed: () {
                pushTo(context, Routes.otp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
