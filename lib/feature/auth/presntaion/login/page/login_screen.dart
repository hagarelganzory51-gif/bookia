import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/bottons/custom_text_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presntaion/login/widget/sociallogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller =TextEditingController();
  var passwordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarWithBack() ,
      body: _bulidLoginBody(),bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("don't have an acction ?", style: TextStyles.styleSize14(),),
          TextButton(onPressed: (){
            pushWithReplacement(context, Routes.register);

          }, 
          child: Text("sign up ",style: TextStyles.styleSize14(color: Appcolors.primarycolor),))
        ],
      ),
    );
  }

  Padding _bulidLoginBody() {
    return Padding(
      padding: 
    const EdgeInsets.all(22),
    child:SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "welcome back! gold to see you, again!",
            style: TextStyles.styleSize30(),
          ),
          Gap(30),
          CustomTextField(
            controller: emailcontroller,
            hint: "enter your email",
          ),
           Gap(12),
          CustomTextField(
            controller: passwordcontroller,
            hint: "enter your password",
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.eyeSvg),
              ],
            ),
          ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(overlayColor: Colors.transparent,
                padding: EdgeInsets.all(0)),
                onPressed: (){},
                child: Text(
                  "forget password?",
                  style: TextStyles.styleSize16(),
                ),
              ),
            ),
      
          Gap(20),
          MainButton(text: "login", onPressed: (){}),
          Gap(20),
           SocialLogin(),
        ],
      ),
    ) ,
    );
  }
}
