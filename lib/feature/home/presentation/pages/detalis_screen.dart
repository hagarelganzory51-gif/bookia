import 'package:bookia/components/app_bar_with_back.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/function/dialogs.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/home/data/model/best_seller_response/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeStateLoading) {
          showLoadingDialog(context);
        } else if (state is HomeStateSucces) {
          pop(context);
          showMyDialog(context, state.message ?? "", type: DialogType.success);
        } else if (state is HomeStateError) {
          pop(context);
          showMyDialog(context, 'Something went wrong');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWithBack(

            action: IconButton(
              onPressed: () {
                cubit.addRemoveWishlist(productId: book.id ?? 0);
              },
              icon: cubit.checkIfWishlist(book.id ?? 0)
                  ? SvgPicture.asset(
                      AppImages.bookmarkSvg,
                      colorFilter: const ColorFilter.mode(
                        Appcolors.primarycolor,
                        BlendMode.srcIn,
                      ),
                    )
                  : SvgPicture.asset(AppImages.bookmarkSvg),
            ),

            action: 
              IconButton(
                onPressed: () {
                  cubit.addRemoveWishlist(productId: book.id ?? 0);
                },
                icon: cubit.checkIfWishlist(book.id ?? 0)
                    ? SvgPicture.asset(
                        AppImages.bookmarkSvg,
                        colorFilter: const ColorFilter.mode(
                          Appcolors.primarycolor,
                          BlendMode.srcIn,
                        ),
                      )
                    : SvgPicture.asset(AppImages.bookmarkSvg),
              ),
            

          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    Hero(
                      tag: book.id ?? "",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: book.image ?? "",
                          height: 270,
                          errorWidget: (context, error, stackTrace) {
                            return Image.asset(
                              AppImages.welcome,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    Gap(25),
                    Text(book.name ?? "", style: TextStyles.styleSize24()),
                    Gap(10),
                    Text(
                      book.category ?? "",
                      style: TextStyles.styleSize16(
                        color: Appcolors.primarycolor,
                      ),
                    ),
                    Gap(20),
                    Text(
                      book.description ?? "",
                      style: TextStyles.styleSize14(),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      book.description ?? "",
                      style: TextStyles.styleSize14(),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),

          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${book.priceAfterDiscount}',
                    style: TextStyles.styleSize24(),
                  ),
                  Gap(40),
                  Expanded(
                    child: MainButton(
                      bgcolor: Appcolors.blackcolor,
                      text: 'Add To Cart',
                      onPressed: () {
                        cubit.addToCart(productId: book.id ?? 0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}



