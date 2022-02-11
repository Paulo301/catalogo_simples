import 'package:flutter/material.dart';

class UserContext extends ChangeNotifier {
  String _token = "";
  final List<String> _favorites = [];

  String get token => _token;
  List<String> get favorites => List.unmodifiable(_favorites);

  void addToken(String token) {
    _token = token;

    notifyListeners();
  }

  void addFavorite(String id){
    if(!_favorites.contains(id)){
      _favorites.add(id);
    }

    notifyListeners();
  }

  void removeFavorite(String id){
    List<String> tempFav = _favorites.map((favorite) => favorite).toList();

    _favorites..clear()..addAll(tempFav.where((fav) => fav != id));

    notifyListeners();
  }

  void clearAll() {
    _token = "";
    _favorites.clear();
    notifyListeners();
  }
}