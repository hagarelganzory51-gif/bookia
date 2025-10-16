import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeCsreen extends StatelessWidget {
  const WelcomeCsreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcome,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(22),
            child: Column(
              children: [
                Spacer(flex: 2),
                SvgPicture.asset(AppImages.logoSvg, width: 220),
                Gap(20),
                Text("order your book now!", style: TextStyles.styleSize18()),
                Spacer(flex: 5),

                MainButton(
                  text: "login",
                  onPressed: () {
                    pushTo(context, Routes.login);
                  },
                ),
                Gap(10),
                MainButton(
                  bordercolor: Appcolors.blackcolor,
                  bgcolor: Appcolors.whitecolor,
                  textcolor: Appcolors.blackcolor,
                  text: "register",
                  onPressed: () {
                    pushTo(context, Routes.register);
                  },
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
