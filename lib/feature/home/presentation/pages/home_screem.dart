import 'package:bookia/core/contants/app_images.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:bookia/feature/home/presentation/widgets/best_seller_builder.dart';
import 'package:bookia/feature/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getInitData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: SvgPicture.asset(AppImages.logoSvg, height: 30),
          actions: [

            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),

          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (state is! HomeStateSucces) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeSlider(sliders: cubit.sliders),
                    Gap(20),
                    BestSellerBuilder(books: cubit.products),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
