import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  final String id;
  final String mangaName;
  final String imageUrl;

  const MangaCard({ 
    Key? key,
    required this.id,
    required this.mangaName,
    required this.imageUrl,
  }) : super(key: key);

  void onPressed(){

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.transparent
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF000000),
                      Color(0x00090909),
                    ],
                    stops: [
                      0.0,
                      0.6
                    ]
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Text(
                    mangaName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ),
          ],
        )
      
    );
  }
}