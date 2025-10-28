import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/home/data/model/best_seller_response/best_seller_response.dart';
import 'package:bookia/feature/home/data/model/best_seller_response/product.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:bookia/feature/wishlist/data/repo/whishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());

  List<Product> products = [];
  List<SliderModel> sliders = [];

  // ignore: strict_top_level_inference
  getInitData() async {
    emit(HomeStateLoading());

    var results = await Future.wait([
      HomeRepo.getSliders(),
      HomeRepo.getBestSellers(),
    ]);

    var sliderRes = results[0] as SliderResponse?;
    var bestSellerRes = results[1] as BestSellerResponse?;

    if (sliderRes != null || bestSellerRes != null) {
      products = bestSellerRes?.data?.products ?? [];
      sliders = sliderRes?.data?.sliders ?? [];
      emit(HomeStateSucces());
    } else {
      emit(HomeStateError(message: "Failed to load data"));
    }
  }




  // ignore: strict_top_level_inference
  addRemoveWishlist({required int productId}) async {
    emit(HomeStateLoading());
    if (checkIfWishlist(productId)) {
      var res = await WishlistRepo.removeToWishlist(productId: productId);
      if (res != null) {
        emit(HomeStateSucces(message: 'Removed from wishlist'));
      } else {
        emit(HomeStateError(message: 'faild'));
      }
    } else {
      var res = await WishlistRepo.addToWishlist(productId: productId);
      if (res != null) {
        emit(HomeStateSucces(message: 'Added to wishlist'));
      } else {
        emit(HomeStateError(message: 'faild'));
      }
    }

  }

  bool checkIfWishlist(int productId) {

}
bool checkIfWishlist(int productId) {

    var cachedWishlist = SharedPref.getWishlist();

    return cachedWishlist?.contains(productId) ?? false;
  }
}
