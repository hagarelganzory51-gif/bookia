import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/cart/data/models/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.book,
    required this.onDelete,
    required this.onRefresh,
  });

  final CartItem book;
  final Function() onDelete;
  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Appcolors.redcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.delete, color: Appcolors.accentcolor),
      ),
      onDismissed: (direction) {
        onDelete();
      },
      child: GestureDetector(
        onTap: () {
          // pushTo(context, Routes.details, extra: book.mapToProduct()).then((
          //   value,
          // ) {
          //   onRefresh();
          // });
        },
        child: Container(
          height: 140,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Appcolors.cardcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Hero(
                tag: book.itemProductId ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: book.itemProductImage ?? '',
                    height: 120,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      book.itemProductName ?? '',
                      style: TextStyles.styleSize18(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(10),
                    Text('\$${book.itemProductPrice}', style: TextStyles.styleSize16()),
                    Gap(10),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
