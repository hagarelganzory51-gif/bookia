import 'dart:developer';
import 'package:bookia/core/services/dio/api_endpoint.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/cart/data/models/cart_response/cart_response.dart';

class CartRepo {
  static Future<CartResponse?> getcart() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoint.cart,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);

        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> addTocart({required int productId}) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.addTocart,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> removeTocart({required int cartItemId}) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.removeFromcart,
        data: {"cart_item_id": cartItemId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
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
