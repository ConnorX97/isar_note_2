import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:note_isar/components/constants.dart';
import 'package:note_isar/components/note_database.dart';
import 'package:note_isar/main.dart';
import 'package:note_isar/pages/edit_note_page.dart';
import 'package:provider/provider.dart';

class EditDeleteButton extends StatelessWidget {
  const EditDeleteButton({
    super.key,
    required this.model,
    required this.index,
  });

  final NoteDatabase model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              showAnimatedDialog(
                animationType: DialogTransitionType.fadeScale,
                duration: const Duration(milliseconds: 400),
                barrierDismissible: true,
                context: context,
                builder: (context) => EditNotePage(
                  index: model.index,
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.buttonColor,
            )),
        12.kW,
        IconButton(
            onPressed: () {
              Navigator.pop(context);
              showAnimatedDialog(
                duration: const Duration(milliseconds: 300),
                context: context,
                builder: (context) => DeleteSheetView(
                  index: index,
                ),
              );
            },
            icon: const Icon(
              Icons.delete,
              color: AppColors.buttonColor,
            ))
      ],
    );
  }
}

class DeleteSheetView extends StatelessWidget {
  final int index;
  const DeleteSheetView({
    super.key,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteDatabase>(context);
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.backgroundColor,
      title: const Text(
        "Delete",
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            color: Colors.white),
      ),
      content: SizedBox(
        height: 92,
        width: 312,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Are you sure?",
              style: TextStyle(fontFamily: "Poppins", color: Colors.white),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    model.deleteNote(model.currentNotes[index].id);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: AppColors.buttonColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel",
                      style: TextStyle(color: AppColors.buttonColor)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
