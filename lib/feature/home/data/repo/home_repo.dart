import 'dart:developer';

import 'package:bookia/core/services/dio/api_endpoint.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/feature/home/data/model/best_seller_response/best_seller_response.dart';
import 'package:bookia/feature/home/data/model/slider_response/slider_response.dart';

class HomeRepo {
  static Future<BestSellerResponse?> getBestSellers() async {
    try {
      var res = await DioProvider.get(endpoint: ApiEndpoint.productsbestseller);
      if (res.statusCode == 200) {
        return BestSellerResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<SliderResponse?> getSliders() async {
    try {
      var res = await DioProvider.get(endpoint: ApiEndpoint.sliders);
      if (res.statusCode == 200) {
        return SliderResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
