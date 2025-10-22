import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/routes/navection.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var userData = SharedPref.getUserData();
    Future.delayed(const Duration(seconds: 3), () {
      if (userData != null) {
        // ignore: use_build_context_synchronously
        pushWithReplacement(context, Routes.main);
      } else {
        // ignore: use_build_context_synchronously
        pushWithReplacement(context, Routes.welcome);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logoSvg, width: 220),
            Gap(10),
            Text("order your book now!", style: TextStyles.styleSize18()),
          ],
        ),
      ),
    );
  }
}
