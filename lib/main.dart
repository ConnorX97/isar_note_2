import 'package:flutter/material.dart';
import 'package:note_isar/components/note_database.dart';
import 'package:note_isar/pages/main_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initalize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => NoteDatabase())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

extension IntExtension on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get kH => SizedBox(
        height: this?.toDouble(),
      );

  Widget get kW => SizedBox(
        width: this?.toDouble(),
      );
}
