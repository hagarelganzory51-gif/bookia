import 'dart:developer';

import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/bottons/custom_text_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/function/dialogs.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presntaion/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presntaion/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildForgetBody(context),

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

  Widget _buildForgetBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccesState) {
          pop(context);
          log("succesful");
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, state.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formkey,
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
                  controller: cubit.emailcontroller,
                  hint: "enter your email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your email";
                    }
                    return null;
                  },
                ),
                Gap(30),

                MainButton(
                  text: " send code",
                  onPressed: () {
                    pushTo(context, Routes.otp);
                    if (cubit.formkey.currentState!.validate()) {
                      cubit.login();
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
