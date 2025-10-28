import 'dart:developer';
import 'package:bookia/core/services/dio/api_endpoint.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/feature/wishlist/data/models/whishlist_response/datum.dart';
import 'package:bookia/feature/wishlist/data/models/whishlist_response/whishlist_response.dart';

class CartRepo {
  static Future<CartResponse?> getcart() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoint.cart,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = cartResponse.fromJson(res.data);

        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WhishlistResponse?> addTocart({required int productId}) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.addTocart,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = cartResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<cartResponse?> removeTocart({required int productId}) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.removeFromcart,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = cartResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
