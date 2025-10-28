import 'package:bookia/feature/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  CartResponse? cartResponse;

  // ignore: strict_top_level_inference
  getCart() async {
    emit(CartLoadingState());
    var res = await CartRepo.getcart();

    if (res != null) {
      cartResponse = res;
      emit(CartSuccessState());
    } else {
      emit(CartErrorState());
    }
  }

  // ignore: strict_top_level_inference
  removeFromCart({required int cartItemId}) async {
    emit(CartLoadingState());
    var res = await CartRepo.removeTocart(cartItemId: cartItemId);

    if (res != null) {
     cartResponse = res;
      emit(CartSuccessState());
    } else {
      emit(CartErrorState());
    }
  }
  // ignore: strict_top_level_inference
  updateCart({required int cartItemId,
  required int quantity}) async {
    
    var res = await CartRepo.updatecart(cartItemId: cartItemId,
    quantity: quantity);

    if (res != null) {
     cartResponse = res;
      emit(CartSuccessState());
    } else {
      emit(CartErrorState());
    }}
}
