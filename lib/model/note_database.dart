import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_note/model/note_model.dart';

class NoteDatabase {
  static late Isar isar;

  // Initialize Database
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // Create Note
  static Future<void> addNote(
    String title,
    String content,
    String category,
  ) async {
    final newNote = Note()
      ..title = title
      ..content = content
      ..category = category;

    await isar.writeTxn(() async {
      await isar.notes.put(newNote);
    });
  }

  // Get All Notes
  static Future<List<Note>> getNotes() async {
    return await isar.notes.where().findAll();
  }

  // Update Note
  static Future<void> updateNote(Note note) async {
    await isar.writeTxn(() async {
      await isar.notes.put(note);
    });
  }

  // Delete Note
  static Future<void> deleteNote(int id) async {
    await isar.writeTxn(() async {
      await isar.notes.delete(id);
    });
  }
}
