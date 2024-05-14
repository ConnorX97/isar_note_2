import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_isar/components/constants.dart';
import 'package:note_isar/components/note_database.dart';
import 'package:note_isar/main.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteDatabase>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Add Note",
          style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              AppInput(
                controller: model.titleController,
                height: 52,
                hint: 'Title',
              ),
              16.kH,
              AppInput(
                controller: model.noteController,
                height: 240,
                hint: 'Note',
              ),
              16.kH,
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ControlBtn(
                  onTap: () {
                    if (model.titleController.text != "") {
                      context.read<NoteDatabase>().addNote(
                          model.titleController.text,
                          model.noteController.text);
                      model.titleController.clear();
                      model.noteController.clear();
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ControlBtn extends StatelessWidget {
  final Function()? onTap;
  const ControlBtn({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.buttonColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      onPressed: onTap,
      label: const Text("Add", style: TextStyle(fontFamily: "Poppins")),
    );
  }
}

// ignore: must_be_immutable
class AppInput extends StatelessWidget {
  TextEditingController controller;
  final int height;
  final String hint;
  AppInput({
    super.key,
    required this.controller,
    required this.height,
    required this.hint,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.toDouble(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          style: const TextStyle(color: Colors.white, fontFamily: "Poppins"),
          cursorColor: Colors.white,
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle:
                  TextStyle(color: Colors.white38, fontFamily: "Poppins")),
        ),
      ),
    );
  }
}
