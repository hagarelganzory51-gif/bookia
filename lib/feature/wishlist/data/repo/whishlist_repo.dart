import 'dart:developer';
import 'package:bookia/core/services/dio/api_endpoint.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/wishlist/data/models/whishlist_response/datum.dart';
import 'package:bookia/feature/wishlist/data/models/whishlist_response/whishlist_response.dart';

class WishlistRepo {
  static Future<WhishlistResponse?> getWishlist() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoint.wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WhishlistResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WhishlistResponse?> addToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.addToWishlist,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WhishlistResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WhishlistResponse?> removeToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoint.removeFromWishlist,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = WhishlistResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  // ignore: strict_top_level_inference
  static saveWishlistToLocal(List<WishlistProduct> wishlistIds) {
    if (wishlistIds.isEmpty) {
      SharedPref.saveWishlist([]);
    } else {
      List<int> bookIds = [];

      for (var id in wishlistIds) {
        bookIds.add(id.id ?? 0);
      }
      SharedPref.saveWishlist(bookIds);
    }
  }
}
