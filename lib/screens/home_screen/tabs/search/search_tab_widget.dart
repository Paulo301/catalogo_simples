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
  List<Manga> mangas = [
    Manga( 
      id: "3156",
      linkSelf: "https://kitsu.io/api/edge/manga/3156",
      title: "Dark Edge",
      synopsis: "After his mother's death, Kuro Takagi transfers to Yotsuji Private High School where his father is the proprietor. But Yotsuji is no ordinary school. It holds a strange rule of “No students on campus after dark!” On his first day of attendance, Kuro and his classmates inadvertently break the school’s highest protocol and find themselves victims of a faculty zombie attack. Although they manage to narrowly escape, this is but a prelude to more encounters with the undead, especially after Kuro discover his own blood-ties and latent zombie abilities. From there, it's full steam ahead as this dark and intense action/comedy shifts into high gear. (Source: DrMaster)",
      posterImage: "https://media.kitsu.io/manga/poster_images/3156/original.jpg",
    ),
    Manga( 
      id: "3156",
      linkSelf: "https://kitsu.io/api/edge/manga/3156",
      title: "Dark Edge",
      synopsis: "After his mother's death, Kuro Takagi transfers to Yotsuji Private High School where his father is the proprietor. But Yotsuji is no ordinary school. It holds a strange rule of “No students on campus after dark!” On his first day of attendance, Kuro and his classmates inadvertently break the school’s highest protocol and find themselves victims of a faculty zombie attack. Although they manage to narrowly escape, this is but a prelude to more encounters with the undead, especially after Kuro discover his own blood-ties and latent zombie abilities. From there, it's full steam ahead as this dark and intense action/comedy shifts into high gear. (Source: DrMaster)",
      posterImage: "https://media.kitsu.io/manga/poster_images/3156/original.jpg",
    ),
    Manga( 
      id: "3156",
      linkSelf: "https://kitsu.io/api/edge/manga/3156",
      title: "Dark Edge",
      synopsis: "After his mother's death, Kuro Takagi transfers to Yotsuji Private High School where his father is the proprietor. But Yotsuji is no ordinary school. It holds a strange rule of “No students on campus after dark!” On his first day of attendance, Kuro and his classmates inadvertently break the school’s highest protocol and find themselves victims of a faculty zombie attack. Although they manage to narrowly escape, this is but a prelude to more encounters with the undead, especially after Kuro discover his own blood-ties and latent zombie abilities. From there, it's full steam ahead as this dark and intense action/comedy shifts into high gear. (Source: DrMaster)",
      posterImage: "https://media.kitsu.io/manga/poster_images/3156/original.jpg",
    ),
    Manga( 
      id: "3156",
      linkSelf: "https://kitsu.io/api/edge/manga/3156",
      title: "Dark Edge",
      synopsis: "After his mother's death, Kuro Takagi transfers to Yotsuji Private High School where his father is the proprietor. But Yotsuji is no ordinary school. It holds a strange rule of “No students on campus after dark!” On his first day of attendance, Kuro and his classmates inadvertently break the school’s highest protocol and find themselves victims of a faculty zombie attack. Although they manage to narrowly escape, this is but a prelude to more encounters with the undead, especially after Kuro discover his own blood-ties and latent zombie abilities. From there, it's full steam ahead as this dark and intense action/comedy shifts into high gear. (Source: DrMaster)",
      posterImage: "https://media.kitsu.io/manga/poster_images/3156/original.jpg",
    ),
    Manga( 
      id: "3156",
      linkSelf: "https://kitsu.io/api/edge/manga/3156",
      title: "Dark Edge",
      synopsis: "After his mother's death, Kuro Takagi transfers to Yotsuji Private High School where his father is the proprietor. But Yotsuji is no ordinary school. It holds a strange rule of “No students on campus after dark!” On his first day of attendance, Kuro and his classmates inadvertently break the school’s highest protocol and find themselves victims of a faculty zombie attack. Although they manage to narrowly escape, this is but a prelude to more encounters with the undead, especially after Kuro discover his own blood-ties and latent zombie abilities. From there, it's full steam ahead as this dark and intense action/comedy shifts into high gear. (Source: DrMaster)",
      posterImage: "https://media.kitsu.io/manga/poster_images/3156/original.jpg",
    ),
    Manga( 
      id: "3156",
      linkSelf: "https://kitsu.io/api/edge/manga/3156",
      title: "Dark Edge",
      synopsis: "After his mother's death, Kuro Takagi transfers to Yotsuji Private High School where his father is the proprietor. But Yotsuji is no ordinary school. It holds a strange rule of “No students on campus after dark!” On his first day of attendance, Kuro and his classmates inadvertently break the school’s highest protocol and find themselves victims of a faculty zombie attack. Although they manage to narrowly escape, this is but a prelude to more encounters with the undead, especially after Kuro discover his own blood-ties and latent zombie abilities. From there, it's full steam ahead as this dark and intense action/comedy shifts into high gear. (Source: DrMaster)",
      posterImage: "https://media.kitsu.io/manga/poster_images/3156/original.jpg",
    ),
    Manga( 
      id: "3156",
      linkSelf: "https://kitsu.io/api/edge/manga/3156",
      title: "Dark Edge",
      synopsis: "After his mother's death, Kuro Takagi transfers to Yotsuji Private High School where his father is the proprietor. But Yotsuji is no ordinary school. It holds a strange rule of “No students on campus after dark!” On his first day of attendance, Kuro and his classmates inadvertently break the school’s highest protocol and find themselves victims of a faculty zombie attack. Although they manage to narrowly escape, this is but a prelude to more encounters with the undead, especially after Kuro discover his own blood-ties and latent zombie abilities. From there, it's full steam ahead as this dark and intense action/comedy shifts into high gear. (Source: DrMaster)",
      posterImage: "https://media.kitsu.io/manga/poster_images/3156/original.jpg",
    )
  ];

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
                                      id: manga.value.id,
                                      imageUrl: manga.value.posterImage,
                                      mangaName: manga.value.title,
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