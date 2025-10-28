import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/bottons/custom_text_field.dart';
import 'package:bookia/components/bottons/password_text_field%20.dart';
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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _bulidRegisterScreenBody(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("already have an acction ?", style: TextStyles.styleSize14()),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.login);
            },
            child: Text(
              "sign in  ",
              style: TextStyles.styleSize14(color: Appcolors.primarycolor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulidRegisterScreenBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccesState) {
          goToBase(context, Routes.main);
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
                Text(
                  "hello! register to get started",
                  style: TextStyles.styleSize30(),
                ),
                Gap(30),
                CustomTextField(
                  controller: cubit.namecontroller,
                  hint: "enter your name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "name is required";
                    }
                    return null;
                  },
                ),

                Gap(12),
                CustomTextField(
                  controller: cubit.emailcontroller,
                  hint: "enter your email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email is required";
                    }
                    return null;
                  },
                ),
                Gap(12),
                PasswordTextField(
                  controller: cubit.passwordcontroller,
                  hint: "enter your password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password is required";
                    }
                    return null;
                  },
                ),
                Gap(12),
                PasswordTextField(
                  controller: cubit.confirapasswordcontroller,
                  hint: "enter your password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "confirmpasswoed is required";
                    }
                    return null;
                  },
                ),
                Gap(30),
                MainButton(
                  text: "Register",
                  onPressed: () {
                    if (cubit.formkey.currentState!.validate()) {
                      cubit.register();
                      pushTo(context, Routes.forget);
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
