// ignore_for_file: file_names

import 'package:map_of_canada/Constant/strings.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_map_tiles/vector_map_tiles.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart' as vtr;

class MapFeatures {
  // yo can change the the by changing the black in the uri to white, greyscale,black,light, dark
  Future<Style> readStyle() => StyleReader(
          uri: 'https://api.protomaps.com/styles/v2/black.json?key=$Apikey',
          apiKey: Apikey,
          logger: const vtr.Logger.console())
      .read();
}
