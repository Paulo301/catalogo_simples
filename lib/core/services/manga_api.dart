import 'package:catalogo_simples/core/model/manga.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class MangaApi {
  // replace by dependency injection
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://kitsu.io/api/edge"
    )
  );

  // final _endpointBase = "https://kitsu.io/api/edge";

  final options = Options(
    contentType: "application/vnd.api+json"
  );

  Future<List<Manga>> getMangaListByTitle(String title) async {
    try {
      final Response response = await _dio.get("/manga?filter[text]="+title, options: options);
      
      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.data) ?? [];
        
        return (data['data'] as List).map((manga) => Manga.fromJson(manga)).toList();
      } else {
        return [];
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }
  // Future<void> getMangaListByTitle(String title) async {
  //   final Response response = await _dio.get("/manga?filter[text]="+title, options: options);
  //   final dynamic data = jsonDecode(response.data) ?? [];
  //   (data['data'] as List).forEach((element) {
  //     print(element['id']);
  //     print(element['links']["self"]);
  //     print(element['attributes']['canonicalTitle']);
  //     // print(element['attributes']['synopsis']);
  //     print(element['attributes']['posterImage']['original']);
  //   });
  // }
}