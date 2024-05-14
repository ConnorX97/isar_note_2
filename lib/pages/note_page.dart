import 'package:flutter/material.dart';
import 'package:note_isar/components/constants.dart';
import 'package:note_isar/components/note_database.dart';
import 'package:note_isar/main.dart';
import 'package:note_isar/pages/widgets/edit_delete_btn.dart';
import 'package:provider/provider.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteDatabase>(context);
    final int index = model.index;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      model.currentNotes[index].title,
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            48.kH,
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Text(
                      model.currentNotes[index].noteDescr,
                      style: const TextStyle(
                          fontFamily: "Poppins", color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: EditDeleteButton(model: model, index: index),
              ),
            )
          ],
        ),
      ),
    );
  }
}
