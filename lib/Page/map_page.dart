import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

import 'package:map_of_canada/features/Map_features.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_map_tiles/vector_map_tiles.dart';
import 'package:vector_map_tiles_pmtiles/vector_map_tiles_pmtiles.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart' as vtr;

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}
// add your supabase get url here
// const String tileSource ='';

class _MapPageState extends State<MapPage> {
  static final MapController _mapController = MapController();
//   final Future<PmTilesVectorTileProvider> _futureTileProvider =
//       PmTilesVectorTileProvider.fromSource(tileSource);
// //this is a final variable where you can change the team
  Style? style;
  // final vtr.Theme mapTheme = ProtomapsThemes.light(
  //   logger: kDebugMode ? const vtr.Logger.console() : null,
  // );

  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: MapFeatures().readStyle(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final style = snapshot.data!;
              print(style.providers);
              return FlutterMap(
                mapController: _mapController,
                options: const MapOptions(
                  initialCenter:
                      LatLng(67.181491, -105.275550), // Center of Canada
                  initialZoom: 3.5,
                  // Zoom level
                ),
                children: [
                  VectorTileLayer(
                    
                      sprites: style.sprites,
                      logCacheStats: true,
                      tileProviders:
                        style.providers,
                      theme: style.theme)
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  // VectorTileProvider _tileProvider() => NetworkVectorTileProvider(
  //       urlTemplate:
  //           'https://api.protomaps.com/tiles/v3/{z}/{x}/{y}.mvt?key=$Apikey',
  //     );
}


 
