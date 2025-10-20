import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/feature/home/presentation/pages/home_screem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreem(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex=index;
          });
        },
        type:BottomNavigationBarType.fixed,
        items:[
        _buildNavBaritem(
          AppImages.homeSvg
          ,"home"
        ),
        _buildNavBaritem(
          AppImages.bookmarkSvg
          ,"bookmark"
        ),
        _buildNavBaritem(
          AppImages.cartSvg
          ,"cart"
        ),
        _buildNavBaritem(
          AppImages.profileSvg
          ,"profile"
        ),

      ]),
    );
  }

  BottomNavigationBarItem _buildNavBaritem(String iconpath,String label) {
    return BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(iconpath,
          colorFilter: ColorFilter.mode(Appcolors.primarycolor, BlendMode.srcIn),),
        icon:SvgPicture.asset(iconpath),label: label);
  }
}