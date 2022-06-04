import 'package:hive/hive.dart';

part 'anime_mini_info.g.dart';

@HiveType(typeId: 0)
class TileData extends HiveObject {
  @HiveField(0)
  String image_url;
  @HiveField(1)
  String title;
  @HiveField(2)
  String mal_id;
  @HiveField(3)
  double score;

  TileData(
      {required this.image_url,
      required this.title,
      required this.mal_id,
      required this.score});

  factory TileData.fromJson(Map<String, dynamic> json) {
    return TileData(
      image_url: json["image_url"],
      title: json["title"],
      mal_id: json["mal_id"].toString(),
      score: json["score"].toDouble(),
    );
  }
}
