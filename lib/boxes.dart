import 'package:hive/hive.dart';
import '/models/anime_mini_info.dart';

class Boxes {
  static Box<TileData> getTileData() => Hive.box<TileData>('tileData');
}
