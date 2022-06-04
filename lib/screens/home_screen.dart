import 'package:cinegenics/components/anime_tile.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../boxes.dart';
import '../models/anime_mini_info.dart';
import 'add_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime List'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<TileData>>(
        valueListenable: Boxes.getTileData().listenable(),
        builder: (context, box, _) {
          final dataTiles = box.values.toList().cast<TileData>();

          return buildContent(dataTiles);
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTile(
                  addFunction: addAnime,
                ),
              ),
            );
          }),
    );
  }

  Widget buildContent(List<TileData> animeItems) {
    if (animeItems.isEmpty) {
      return const Center(
        child: Text(
          'Belum Ada Anime yang Ditambahkan!',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: animeItems.length,
              itemBuilder: (BuildContext context, int index) {
                final anime = animeItems[index];
                return Dismissible(
                  key: Key(anime.mal_id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.delete_forever,
                          color: Colors.white, size: 50.0)),
                  onDismissed: (direction) {
                    deleteTransaction(anime);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${anime.title} Terhapus')));
                  },
                  child: AnimeCard(td: anime),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  Future addAnime(TileData td) async {
    final animetile = TileData(
      image_url: td.image_url,
      mal_id: td.mal_id,
      title: td.title,
      score: td.score,
    );

    final box = Boxes.getTileData();
    box.add(animetile);
  }

  void deleteTransaction(TileData anime) {
    anime.delete();
  }
}

//     // ListView.builder(
//     //   itemCount: _tiles.length,
//     //   itemBuilder: (BuildContext context, int index) {
//     //     return FutureBuilder(builder: ((context, snapshot) =>

//     //     ));
//     //   },
//     // ),
//     // FilmTile(
//     //   td: TileData(
//     //       imageUrl:
//     //           "https://image.tmdb.org/t/p/original/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
//     //       title: "Fight Club",
//     //       movieId: "550",
//     //       userRating: 8.4),
//     // ),
// //         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //         floatingActionButton: FloatingActionButton(
// //             onPressed: () {
// //               // Navigator.push(context,
// //               //     MaterialPageRoute(builder: (context) => FileItemScreen()));
// //               setState(() {
// //                 var newMovies = CinegenicsApi.searchFilm(query: "Bhool Bhulaiyaa");
// //                 _tiles.addAll(newMovies);
// //               });
// //             },
// //             child: const Icon(Icons.add)),
// //       ),
// //     );
// //   } 

