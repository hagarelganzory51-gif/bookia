import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _buildOtpBody(),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Didn’t received code?  ", style: TextStyles.styleSize14()),
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.forget);
            },
            child: Text(
              "Resend",
              style: TextStyles.styleSize14(color: Appcolors.primarycolor),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildOtpBody() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("OTP Verification", style: TextStyles.styleSize30()),
            Gap(12),
            Text(
              "Enter the verification code we just sent on your email address.",
              style: TextStyles.styleSize16(color: Appcolors.grycolor),
            ),
            Gap(30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Appcolors.primarycolor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Appcolors.primarycolor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),

            Gap(30),
            MainButton(
              text: " Verify",
              onPressed: () {
                pushTo(context, Routes.passwordchange);
              },
            ),
          ],
        ),
      ),
    );
  }
}
