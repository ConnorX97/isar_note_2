import 'package:flutter/material.dart';
import 'package:note_isar/components/constants.dart';
import 'package:note_isar/components/note_database.dart';
import 'package:note_isar/main.dart';
import 'package:note_isar/pages/add_note_page.dart';
import 'package:provider/provider.dart';

class EditNotePage extends StatelessWidget {
  final int index;
  const EditNotePage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteDatabase>(context);
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.backgroundColor,
      content: SizedBox(
        width: 380,
        height: 450,
        child: SizedBox(
          child: Column(
            children: [
              5.kH,
              AppInput(
                  maxLine: 1,
                  controller: model.titleController,
                  height: 52,
                  hint: " "),
              16.kH,
              AppInput(
                  maxLine: null,
                  controller: model.titleController,
                  height: 315,
                  hint: " "),
              5.kH,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SaveBtn(onTap: () {}),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel",
                        style: TextStyle(
                            fontFamily: "Poppins", color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SaveBtn extends StatelessWidget {
  final Function()? onTap;
  const SaveBtn({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: const Text("Save",
          style: TextStyle(fontFamily: "Poppins", color: Colors.white)),
    );
  }
}

// // ignore: must_be_immutable
// class EditInput extends StatelessWidget {
//   TextEditingController controller;
//   final int? maxLine;
//   final int height;
//   final String hint;
//   EditInput({
//     super.key,
//     required this.controller,
//     required this.height,
//     required this.hint,
//     this.maxLine,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: height.toDouble(),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: AppColors.primaryColor),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: SingleChildScrollView(
//             child: TextField(
              
//               style:
//                   const TextStyle(color: Colors.white, fontFamily: "Poppins"),
//               cursorColor: Colors.white,
//               controller: controller,
//               maxLines: maxLine,
//               decoration: InputDecoration(
                
//                   border: InputBorder.none,
//                   hintText: hint,
//                   hintStyle: const TextStyle(
//                       color: Colors.white38, fontFamily: "Poppins")),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
