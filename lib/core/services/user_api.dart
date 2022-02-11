import 'package:catalogo_simples/core/model/manga.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class UserApi {
  // replace by dependency injection
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:3000"
    )
  );

  // final _endpointBase = "https://kitsu.io/api/edge";

  final options = Options(
    contentType: "application/vnd.api+json"
  );

  Future<List<Manga>> getUserFavorites(String title) async {
    // try {
    //   final Response response = await _dio.get("/favorites", options: options);
      
    //   if (response.statusCode == 200) {
    //     final dynamic data = jsonDecode(response.data) ?? [];
        
    //     return (data['data'] as List).map((manga) => Manga.fromJson(manga)).toList();
    //   } else {
    //     return [];
    //   }
    // } on DioError catch (e) {
    //   throw Exception(e.message);
    // } catch (e) {
    //   rethrow;
    // }
    return [];
  }
}