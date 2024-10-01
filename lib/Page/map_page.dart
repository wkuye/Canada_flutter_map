import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:map_of_canada/Constant/strings.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_map_tiles/vector_map_tiles.dart';
import 'package:vector_map_tiles_pmtiles/vector_map_tiles_pmtiles.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart' as vtr;

class MapPage extends StatefulWidget {
 
  const MapPage({super.key, });

  @override
  State<MapPage> createState() => _MapPageState();
}

const String tileSource =lagos;

class _MapPageState extends State<MapPage> {
  static final MapController _mapController = MapController();
  final Future<PmTilesVectorTileProvider> _futureTileProvider =
      PmTilesVectorTileProvider.fromSource(tileSource);
//this is a final variable where you can change the team
  final vtr.Theme mapTheme = ProtomapsThemes.dark(
    logger: kDebugMode ? const vtr.Logger.console() : null,
  );

 

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: FutureBuilder(
        future: _futureTileProvider,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final tileProvider = snapshot.data!;
            return Stack(children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                    initialCameraFit: CameraFit.bounds(
                        bounds: LatLngBounds(const LatLng(6.391730, 2.702637),
                            const LatLng(6.653695, 4.339600))),
                    initialCenter: const LatLng(6.522712, 3.521119),
                    initialZoom: 10),
                children: [
                  VectorTileLayer(
                    logCacheStats: true,

                    showTileDebugInfo: true,
                    // disable the file cache when you change the PMTiles source

                    theme: mapTheme,

                    tileProviders: TileProviders({
                      'protomaps': tileProvider,
                    }),
                  ),
                ],
              ),
            ]);
          }
          if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            debugPrintStack(stackTrace: snapshot.stackTrace);
            return Center(child: Text(snapshot.error.toString()));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
