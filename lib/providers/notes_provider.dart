import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/note.dart';
import '../data/repositories/note_repository.dart';

enum ViewMode { grid, list }

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  throw UnimplementedError('Repository not initialized');
});

class NotesNotifier extends Notifier<List<Note>> {
  @override
  List<Note> build() {
    return ref.watch(noteRepositoryProvider).getAllNotes();
  }

  void refresh() {
    state = ref.read(noteRepositoryProvider).getAllNotes();
  }

  Future<void> add(Note note) async {
    await ref.read(noteRepositoryProvider).addNote(note);
    refresh();
  }

  Future<void> updateNote(Note note) async {
    await ref.read(noteRepositoryProvider).updateNote(note);
    refresh();
  }

  Future<void> delete(String id) async {
    await ref.read(noteRepositoryProvider).deleteNote(id);
    refresh();
  }
}

final notesProvider = NotifierProvider<NotesNotifier, List<Note>>(() {
  return NotesNotifier();
});

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';
  
  void updateState(String value) {
    state = value;
  }
}

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(() {
  return SearchQueryNotifier();
});

class ViewModeNotifier extends Notifier<ViewMode> {
  @override
  ViewMode build() => ViewMode.grid;
  
  void updateState(ViewMode value) {
    state = value;
  }
}

final viewModeProvider = NotifierProvider<ViewModeNotifier, ViewMode>(() {
  return ViewModeNotifier();
});

final filteredNotesProvider = Provider<List<Note>>((ref) {
  final query = ref.watch(searchQueryProvider);
  
  if (query.isNotEmpty) {
    final repository = ref.read(noteRepositoryProvider);
    return repository.searchNotes(query);
  }
  
  return ref.watch(notesProvider);
});
