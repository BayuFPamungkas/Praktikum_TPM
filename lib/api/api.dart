import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class AnimeApi {
  static Future<List<TileData>> searchAnime({required String query}) async {
    final url =
        "https://api.jikan.moe/v3/search/anime?q=$query";
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> searchResp = jsonDecode(response.body);
    final List<dynamic> searchresults = searchResp["results"];
    return <TileData>[
      ...searchresults.map((e) => TileData.fromJson(e)),
    ];
  }
}
