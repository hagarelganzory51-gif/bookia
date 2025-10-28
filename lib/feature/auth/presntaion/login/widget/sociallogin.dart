import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Gap(10),
            Text(
              "or login with",
              style: TextStyles.styleSize16(color: Appcolors.blackcolor),
            ),
            Gap(10),
            Expanded(child: Divider()),
          ],
        ),
        Gap(20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            SocialButton(
              image: AppImages.gooleSvg,
              text: "sign in with google",
            ),
            SocialButton(image: AppImages.appleSvg, text: "sign in with apple"),
          ],
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Appcolors.bordercolor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          Gap(10),
          Text('sign in with google', style: TextStyles.styleSize14()),
        ],
      ),
    );
  }
}
