import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:developer';
class ApiService{
  final dio = Dio(BaseOptions(
      responseType: ResponseType.plain,
      ));
  Future<Response<dynamic>?> login(credentials) async {
    try {
      final response = await dio.post("https://fakestoreapi.com/auth/login",
          data: jsonEncode(credentials));
      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
  //product list
  Future<Response<dynamic>?> getProductList() async {
    try {
      final response = await dio.get("https://fakestoreapi.com/products");
      log(response.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}