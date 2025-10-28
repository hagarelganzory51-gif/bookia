import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/feature/cart/presentation/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(title: Text('CartScreen')),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            var cubit = context.read<CartCubit>();
            var books = cubit.cartResponse?.data?.cartItems ?? [];
            if (state is! CartSuccessState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (books.isEmpty) {
              return _emptyUI();
            }
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: books.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },

              itemBuilder: (BuildContext context, int index) {
                return CartCard(
                  book: books[index],
                  onDelete: () {
                    cubit.removeFromCart(
                      cartItemId: books[index].itemId?? 0,
                    );
                  },
                  onRefresh: () {
                    cubit.getCart();
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
          Text('No books in CartScreen'),
        ],
      ),
    );
  }
}
