import 'package:flutter/material.dart';

import 'package:map_of_canada/Page/map_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MapPage());
  }
}
