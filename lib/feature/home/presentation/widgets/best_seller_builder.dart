import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/home/data/model/best_seller_response/product.dart';
import 'package:bookia/feature/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key, required this.books});

  final List<Product> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Best Seller", style: TextStyles.styleSize24()),
        Gap(15),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 300,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookCard(book: books[index]);
          },
        ),
      ],
    );
  }
}
