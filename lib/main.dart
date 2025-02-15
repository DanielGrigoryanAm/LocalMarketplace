import 'package:flutter/material.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:local_marketplace/features/presentation/screens/map_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // String envPath = "/Users/daniel/Desktop/Flutter_a/local_marketplace/.env";
  // await dotenv.load(fileName: envPath);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

