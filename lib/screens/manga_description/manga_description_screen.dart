import 'package:catalogo_simples/core/model/manga.dart';
import 'package:catalogo_simples/core/model/user_context.dart';
import 'package:catalogo_simples/core/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MangaDescriptionScreen extends StatefulWidget {
  final Manga manga;
  
  const MangaDescriptionScreen({ Key? key, required this.manga }) : super(key: key);

  @override
  State<MangaDescriptionScreen> createState() => _MangaDescriptionScreenState();
}

class _MangaDescriptionScreenState extends State<MangaDescriptionScreen> {
  final UserApi _userApi = UserApi();
  
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF011627),
      appBar: AppBar(
        backgroundColor: const Color(0x33070600),
        centerTitle: true,
        title: const Text("Descrição"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    width: _screenWidth*0.375,
                    height: _screenWidth*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(widget.manga.posterImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      widget.manga.title,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Consumer<UserContext>(builder: (context, userContext, child) {
                  if(userContext.favorites.contains(widget.manga.id)){
                    return TextButton(
                      onPressed: (){
                        _userApi.removeFavorite(widget.manga.id, userContext.token).then((value) {
                            userContext.removeFavorite(widget.manga.id);
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Alerta'),
                                content: const Text('Manga removido do catálogo'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, "OK"),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      }, 
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: const Color(0xFFFDFFFC),
                            size: MediaQuery.of(context).size.width * 0.07,
                          ),
                          Text(
                            "Remover do catálogo",
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      )
                    );
                  } else {
                    return TextButton(
                      onPressed: (){
                        _userApi.addFavorite(widget.manga.id, userContext.token).then((value) {
                            userContext.addFavorite(widget.manga.id);
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Alerta'),
                                content: const Text('Manga adicionado ao catálogo'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, "OK"),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      }, 
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            color: const Color(0xFFFDFFFC),
                            size: MediaQuery.of(context).size.width * 0.07,
                          ),
                          Text(
                            "Adicionar ao catálogo",
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      )
                    );
                  }
                })
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                widget.manga.synopsis,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
      ),
    );
  }
}