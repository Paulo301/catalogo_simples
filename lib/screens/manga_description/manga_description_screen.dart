import 'package:catalogo_simples/core/model/manga.dart';
import 'package:flutter/material.dart';

class MangaDescriptionScreen extends StatelessWidget {
  final Manga manga;
  
  const MangaDescriptionScreen({ Key? key, required this.manga }) : super(key: key);

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
                        image: NetworkImage(manga.posterImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      manga.title,
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
                child: TextButton(
                  onPressed: (){}, 
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
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                manga.synopsis,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
      ),
    );
  }
}