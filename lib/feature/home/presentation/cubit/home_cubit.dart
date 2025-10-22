import 'package:bookia/feature/home/data/model/best_seller_response/best_seller_response.dart';
import 'package:bookia/feature/home/data/model/best_seller_response/product.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());

  List<Product> products = [];
  List<SliderModel> sliders = [];

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
   
}