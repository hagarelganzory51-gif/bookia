import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/bottons/custom_text_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    var namecontroller =TextEditingController();
  var emailcontroller =TextEditingController();
  var passwordcontroller =TextEditingController();
    var confirapasswordcontroller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarWithBack() ,
      body: _bulidRegisterScreenBody(),bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("already have an acction ?", style: TextStyles.styleSize14(),),
          TextButton(onPressed: (){
            pushWithReplacement(context, Routes.login);
          }, 
          child: Text("sign in  ",style: TextStyles.styleSize14(color: Appcolors.primarycolor),))
        ],
      ),
    );
  }

  Padding _bulidRegisterScreenBody() {
    return Padding(
      padding: 
    const EdgeInsets.all(22),
    child:SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "hello! register to get started",
            style: TextStyles.styleSize30(),
          ), Gap(30),
          CustomTextField(
            controller: namecontroller,
            hint: "enter your name",
          ),


          Gap(12),
          CustomTextField(
            controller: emailcontroller,
            hint: "enter your email",
          ),
           Gap(12),
          CustomTextField(
            controller: passwordcontroller,
            hint: "enter your password",
           
          ),
          Gap(12),CustomTextField(
            controller: passwordcontroller,
            hint: "enter your password",
          ),
          Gap(30),
          MainButton(text: "RegisterScreen", onPressed: (){}),
         
          
        ],
      ),
    ) ,
    );
  }
}
