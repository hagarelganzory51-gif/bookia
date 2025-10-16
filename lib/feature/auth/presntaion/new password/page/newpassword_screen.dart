import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/bottons/custom_text_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewpasswordScreen extends StatefulWidget {
  const NewpasswordScreen({super.key});

  @override
  State<NewpasswordScreen> createState() => _NewpasswordScreenState();
}

class _NewpasswordScreenState extends State<NewpasswordScreen> {
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarWithBack(), body: _buildNewPasswordBody());
  }

  Padding _buildNewPasswordBody() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Create new password", style: TextStyles.styleSize30()),
            Gap(12),
            Text(
              "Your new password must be unique from those previously used.",
              style: TextStyles.styleSize16(color: Appcolors.grycolor),
            ),
            Gap(30),
            CustomTextField(controller: newController, hint: "New Password"),
            Gap(30),
            CustomTextField(
              controller: confirmController,
              hint: "Confirm Password",
            ),
            Gap(30),
            MainButton(
              text: " Reset Password",
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
