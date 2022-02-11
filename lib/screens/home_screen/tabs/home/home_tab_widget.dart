import 'package:catalogo_simples/core/model/manga.dart';
import 'package:catalogo_simples/core/model/user_context.dart';
import 'package:catalogo_simples/core/services/user_api.dart';
import 'package:catalogo_simples/core/widgets/manga_card.dart';
import 'package:catalogo_simples/core/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({ Key? key }) : super(key: key);

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  final TextEditingController _searchController = TextEditingController();
  final UserApi _userApi = UserApi();

  String searchText = "";
  List<String> favorites = [];
  List<Manga> mangas = [];
  List<Manga> filteredMangas = [];

  void doSearch() {
    setState(() {
      if(searchText != ""){
        filteredMangas = mangas.where((manga) => manga.title.contains(searchText)).toList();
      } else{
        filteredMangas = mangas;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    final UserContext _userContext = Provider.of<UserContext>(context, listen: false);
    
    if(_userContext.token != ""){
      _userApi.getUserFavorites(_userContext.token).then((value) {
        setState(() {
          favorites = value;
        });
        _userContext.addAllFavorites(value);
      });
    } 

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
              child: Consumer<UserContext>(builder: (context, userContext, child) {
                if(userContext.token != ""){
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.75,
                    children: filteredMangas
                                .asMap()
                                .entries
                                .map((manga) => (
                                  MangaCard(
                                    manga: manga.value,
                                  )
                                )).toList()
                  );
                } else {
                  return Center(
                    child: Text(
                      'Entre para visualizar os favoritos',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  );
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}