import 'package:flutter/material.dart';
import 'package:note_isar/components/constants.dart';
import 'package:note_isar/components/note_database.dart';
import 'package:note_isar/main.dart';
import 'package:note_isar/pages/widgets/edit_delete_btn.dart';
import 'package:provider/provider.dart';

class QuickView extends StatelessWidget {
  final int index;
  const QuickView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.backgroundColor,
      content: SizedBox(
        width: 380,
        height: 390,
        child: QuickViewItem(),
      ),
    );
  }
}

class QuickViewItem extends StatelessWidget {
  const QuickViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteDatabase>(context);
    final int index = model.index;
    return Column(
      children: [
        Container(
          height: 38,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                model.currentNotes[index].title,
                style: const TextStyle(
                    fontFamily: "Poppins", fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
        16.kH,
        Container(
          height: 270,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text(
                model.currentNotes[index].noteDescr,
                style:
                    const TextStyle(fontFamily: "Poppins", color: Colors.white),
              ),
            ),
          ),
        ),
        16.kH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EditDeleteButton(model: model, index: index),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.buttonColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
