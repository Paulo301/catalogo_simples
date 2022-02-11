import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class UserApi {
  // replace by dependency injection
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.0.223:8080"
    )
  );

  final options = Options(
    contentType: "application/json"
  );

  Future<List<String>> getUserFavorites(String token) async {
    try {
      final Response response = await _dio.get(
        "/listar-favoritos", 
        options: Options(
          contentType: "application/json",
          headers: {
            'Authorization': token
          }
        )
      );
      
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

  Future<String> login(String login, String password) async {
    try {
      final Response response = await _dio.post(
        "/login", 
        options: options,
        data: { 'login': login, 'password': password }
      );

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.data) ?? [];
        
        return data['token'];
      } else {
        return "";
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addFavorite(String id, String token) async {
    try {
      final Response response = await _dio.post(
        "/adicionar-favorito", 
        options: Options(
          contentType: "application/json",
          headers: {
            'Authorization': token
          }
        ),
        data: { id }
      );

      if (response.statusCode == 200) {
        final String data = response.data ?? [];
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFavorite(String id, String token) async {
    try {
      final Response response = await _dio.post(
        "/remover-favorito", 
        options: Options(
          contentType: "application/json",
          headers: {
            'Authorization': token
          }
        ),
        data: { id }
      );

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