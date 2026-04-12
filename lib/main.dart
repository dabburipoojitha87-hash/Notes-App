import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'data/models/note.dart';
import 'data/repositories/note_repository.dart';
import 'providers/notes_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  
  // Initialize Repository
  final repository = NoteRepository();
  await repository.init();

  runApp(
    ProviderScope(
      overrides: [
        noteRepositoryProvider.overrideWithValue(repository),
      ],
      child: const NotesApp(),
    ),
  );
}
