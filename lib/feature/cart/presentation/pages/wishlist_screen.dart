import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/whishlist_cubit.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/whishlist_state.dart';
import 'package:bookia/feature/wishlist/presentation/widgets/whishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(title: Text('Wishlist')),
        body: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            var cubit = context.read<WishlistCubit>();
            if (state is! WishlistSuccessState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (cubit.books.isEmpty) {
              return _emptyUI();
            }
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: cubit.books.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },

              itemBuilder: (BuildContext context, int index) {
                return WishlistCard(
                  book: cubit.books[index],
                  onDelete: () {
                    cubit.removeFromWishlist(
                      productId: cubit.books[index].id ?? 0,
                    );
                  },
                  onRefresh: () {
                    cubit.getWishlist();
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Center _emptyUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.bookmarkSvg,
            height: 100,
            colorFilter: const ColorFilter.mode(
              Appcolors.primarycolor,
              BlendMode.srcIn,
            ),
          ),
          Gap(20),
          Text('No books in wishlist'),
        ],
      ),
    );
  }
}
