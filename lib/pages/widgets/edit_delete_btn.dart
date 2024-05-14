import 'package:flutter/material.dart';
import 'package:note_isar/components/constants.dart';
import 'package:note_isar/components/note_database.dart';
import 'package:note_isar/main.dart';

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
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: AppColors.buttonColor,
            )),
        12.kW,
        IconButton(
            onPressed: () {
              model.deleteNote(model.currentNotes[index].id);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete,
              color: AppColors.buttonColor,
            ))
      ],
    );
  }
}
