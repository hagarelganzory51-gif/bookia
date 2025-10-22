import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text('Best Sellers',style: TextStyles.styleSize24()),
    Gap(15),
    GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 280,
      crossAxisCount: 2),
      itemCount: 7,
      itemBuilder: (context, index) {
      return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Appcolors.cardcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppImages.welcome,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(10),
            SizedBox(
              height: 40,
              child: Text(
                'Book name',
                style: TextStyles.styleSize16( ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),
            ), 
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$20',style: TextStyles.styleSize16()),
                MainButton(
                  height: 30,
                  width: 80,
                  bgcolor: Appcolors.blackcolor,
                  text: "buy", onPressed: (){}),
              ],
            ) ,
          ],
        ),
      );
    },
    ),
      ],
    );
  }
}
