import 'package:bookia/feature/wishlist/data/models/whishlist_response/datum.dart';
import 'package:bookia/feature/wishlist/data/repo/whishlist_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/whishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitialState());

  List<WishlistProduct> books = [];

  // ignore: strict_top_level_inference
  getWishlist() async {
    emit(WishlistLoadingState());
    var res = await WishlistRepo.getWishlist();

    if (res != null) {
      books = res.data?.data ?? [];
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState());
    }
  }

  // ignore: strict_top_level_inference
  removeFromWishlist({required int productId}) async {
    emit(WishlistLoadingState());
    var res = await WishlistRepo.removeToWishlist(productId: productId);

    if (res != null) {
      books = res.data?.data ?? [];
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState());
    }
  }
}
