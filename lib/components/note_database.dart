import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:note_isar/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  static late Isar isar;

  static Future<void> initalize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  final List<Note> currentNotes = [];
  int index = 0;
  Future<void> addNote(String titleFromUser, String textFromUser) async {
    final newNote = Note()
      ..title = titleFromUser
      ..noteDescr = textFromUser;
    await isar.writeTxn(() => isar.notes.put(newNote));
    fetchedNotes();
  }

  Future<void> fetchedNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  Future<void> updateNote(int id, String newTitle, String newText) async {
    final extistingNote = await isar.notes.get(id);
    if (extistingNote != null) {
      extistingNote.title = newTitle;
      extistingNote.noteDescr = newText;

      await isar.writeTxn(() => isar.notes.put(extistingNote));
      await fetchedNotes();
    }
  }

  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchedNotes();
  }
}
