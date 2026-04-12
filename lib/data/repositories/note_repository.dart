import 'package:hive_flutter/hive_flutter.dart';
import '../models/note.dart';

class NoteRepository {
  static const String boxName = 'notes_box';
  
  late Box<Note> _box;

  Future<void> init() async {
    _box = await Hive.openBox<Note>(boxName);
  }
  
  List<Note> getAllNotes() {
    final notes = _box.values.toList();
    notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return notes;
  }

  Future<void> addNote(Note note) async {
    await _box.put(note.id, note);
  }

  Future<void> updateNote(Note note) async {
    await _box.put(note.id, note);
  }

  Future<void> deleteNote(String id) async {
    await _box.delete(id);
  }

  List<Note> searchNotes(String query) {
    if (query.isEmpty) return getAllNotes();
    
    final lowerQuery = query.toLowerCase();
    final notes = _box.values.where((note) {
      return note.title.toLowerCase().contains(lowerQuery) || 
             note.content.toLowerCase().contains(lowerQuery);
    }).toList();
    
    notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return notes;
  }
}
