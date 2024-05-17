import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:note_isar/components/constants.dart';
import 'package:note_isar/components/note_database.dart';
import 'package:note_isar/pages/widgets/note_tile.dart';
import 'package:note_isar/pages/add_note_page.dart';
import 'package:note_isar/pages/note_page.dart';
import 'package:note_isar/pages/widgets/long_tap_quick_view.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    readNotes();
  }

  void readNotes() {
    context.read<NoteDatabase>().fetchedNotes();
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteDatabase>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddNotePage()));
        },
        backgroundColor: AppColors.buttonColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              "Notes",
              style: TextStyle(
                  fontSize: 48, fontFamily: "Serif", color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: model.currentNotes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    model.index = index;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NoteView()));
                  },
                  child: NoteTile(
                    delete: () => deleteNote(model.currentNotes[index].id),
                    title: model.currentNotes[index].title,
                    text: model.currentNotes[index].noteDescr,
                    longTap: () {
                      model.index = index;
                      showAnimatedDialog(
                        animationType: DialogTransitionType.fadeScale,
                        duration: const Duration(milliseconds: 400),
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => QuickView(
                          index: model.index,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
