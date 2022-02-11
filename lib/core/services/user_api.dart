import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class UserApi {
  // replace by dependency injection
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:8080"
    )
  );

  // final _endpointBase = "https://kitsu.io/api/edge";

  final options = Options(
    contentType: "application/vnd.api+json"
  );

  Future<List<int>> getUserFavorites(String title) async {
    try {
      final Response response = await _dio.get("/listar-favoritos", options: options);
      
      if (response.statusCode == 200) {
        final String data = jsonDecode(response.data) ?? [];
        
        return [];
      } else {
        return [];
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> login() async {
    try {
      final Response response = await _dio.get("/login", options: options);

      if (response.statusCode == 200) {
        final String data = response.data ?? [];

        return "";
      } else {
        return "";
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addFavorite() async {
    try {
      final Response response = await _dio.get("/adicionar-favorito", options: options);

      if (response.statusCode == 200) {
        final String data = response.data ?? [];

      }
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFavorite() async {
    try {
      final Response response = await _dio.get("/remover-favorito", options: options);

      if (response.statusCode == 200) {
        final String data = response.data ?? [];

      } 
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }
}