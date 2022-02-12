import 'package:flutter/material.dart';

class UserContext extends ChangeNotifier {
  String _token = "";
  bool _favoritesEdited = false;
  final List<String> _favorites = [];

  String get token => _token;
  bool get favoritesEdited => _favoritesEdited;
  List<String> get favorites => List.unmodifiable(_favorites);

  void addToken(String token) {
    _token = token;
    
    notifyListeners();
  }

  void addAllFavorites(List<String> favs) {
    _favorites.addAll(favs);
    _favoritesEdited = true;
    notifyListeners();
  }

  void addFavorite(String id){
    if(!_favorites.contains(id)){
      _favorites.add(id);
    }
    _favoritesEdited = true;
    notifyListeners();
  }

  void removeFavorite(String id){
    List<String> tempFav = _favorites.map((favorite) => favorite).toList();

    _favorites..clear()..addAll(tempFav.where((fav) => fav != id));
    _favoritesEdited = true;
    notifyListeners();
  }

  void addFavoritesEdited(bool edited) {
    _favoritesEdited = edited;
    
    notifyListeners();
  }

  void clearAll() {
    _token = "";
    _favorites.clear();
    _favoritesEdited = false;
    notifyListeners();
  }
}