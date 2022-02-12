import 'package:catalogo_simples/core/model/manga.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class MangaApi {
  // replace by dependency injection
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://kitsu.io/api/edge"
    )
  );

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

  Future<List<Manga>> getMangaListById(List<String> ids) async {
    try {
      final Response response = await _dio.get(
        "/manga?filter[id]="+ids.reduce((value, element) => value+","+element), 
        options: options
      );
      
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
}