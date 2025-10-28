import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/bottons/Password_Text_Field%20.dart';
import 'package:bookia/components/bottons/custom_text_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/function/dialogs.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presntaion/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presntaion/cubit/auth_state.dart';
import 'package:bookia/feature/auth/presntaion/login/widget/sociallogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _bulidLoginBody(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("don't have an acction ?", style: TextStyles.styleSize14()),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.register);
            },
            child: Text(
              "sign up ",
              style: TextStyles.styleSize14(color: Appcolors.primarycolor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulidLoginBody(BuildContext context) {
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
                  "welcome back! gold to see you, again!",
                  style: TextStyles.styleSize30(),
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
                Gap(12),
                PasswordTextField(
                  controller: cubit.passwordcontroller,
                  hint: "enter your password",

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your password";
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                    ),
                    onPressed: () {},
                    child: Text(
                      "forget password?",
                      style: TextStyles.styleSize16(),
                    ),
                  ),
                ),

                Gap(20),
                MainButton(
                  text: "login",
                  onPressed: () {
                    if (cubit.formkey.currentState!.validate()) {
                      cubit.login();
                    }
                  },
                ),
                Gap(20),
                SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
