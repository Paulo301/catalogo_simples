import 'package:catalogo_simples/core/model/manga.dart';
import 'package:catalogo_simples/core/services/manga_api.dart';
import 'package:catalogo_simples/core/widgets/manga_card.dart';
import 'package:catalogo_simples/core/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SearchTabWidget extends StatefulWidget {
  const SearchTabWidget({ Key? key }) : super(key: key);

  @override
  State<SearchTabWidget> createState() => _SearchTabWidgetState();
}

class _SearchTabWidgetState extends State<SearchTabWidget> {
  final TextEditingController _searchController = TextEditingController();
  final MangaApi _mangaApi = MangaApi();

  String searchText = "";
  List<Manga> mangas = [];

  void doSearch() {
    _mangaApi.getMangaListByTitle(searchText).then((value) => {
      setState(() {
        mangas = value;
      })
    });
  }

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          SearchBarWidget(
            controller: _searchController,
            onPressed: doSearch,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.75,
                      children: mangas
                                  .asMap()
                                  .entries
                                  .map((manga) => (
                                    MangaCard(
                                      manga: manga.value,
                                    )
                                  )).toList()
                    ),
            ),
          )
        ],
      ),
    );
  }
}