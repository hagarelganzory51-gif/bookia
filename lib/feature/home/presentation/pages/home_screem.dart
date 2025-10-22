import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/feature/home/presentation/widgets/best_seller_builder.dart';
import 'package:bookia/feature/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreem extends StatelessWidget {
  const HomeScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:false,
        title:  SvgPicture.asset(AppImages.logoSvg,height: 30,),
        actions: [
          IconButton(
            onPressed: () {},
            icon:Icon(  Icons.search,
            size: 30,
            )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeSlider(),
              Gap(20),
              BestSellerBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
