import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/notes_provider.dart';
import '../core/theme/app_theme.dart';
import '../widgets/note_card.dart';
import '../widgets/note_list_tile.dart';
import '../widgets/search_bar.dart';
import '../widgets/empty_state.dart';
import 'note_editor_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isSearchVisible = false;

  void _confirmDelete(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Note?', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Are you sure you want to delete this note? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL', style: TextStyle(color: AppTheme.foregroundColor, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFD1DC), // Baby pink for delete action
            ),
            onPressed: () {
              ref.read(notesProvider.notifier).delete(id);
              Navigator.pop(context);
            },
            child: const Text('DELETE'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(filteredNotesProvider);
    final viewMode = ref.watch(viewModeProvider);
    final isSearching = ref.watch(searchQueryProvider).isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: Icon(_isSearchVisible ? Icons.search_off : Icons.search),
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
                if (!_isSearchVisible) {
                  ref.read(searchQueryProvider.notifier).updateState('');
                }
              });
            },
          ),
          IconButton(
            icon: Icon(viewMode == ViewMode.grid ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              ref.read(viewModeProvider.notifier).updateState(
                  viewMode == ViewMode.grid ? ViewMode.list : ViewMode.grid);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          if (_isSearchVisible) const PixelSearchBar(),
          Expanded(
            child: notes.isEmpty
                ? EmptyState(isSearch: isSearching)
                : (viewMode == ViewMode.grid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          final note = notes[index];
                          return NoteCard(
                            note: note,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteEditorScreen(note: note),
                              ),
                            ),
                            onLongPress: () => _confirmDelete(context, note.id),
                          );
                        },
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          final note = notes[index];
                          return NoteListTile(
                            note: note,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteEditorScreen(note: note),
                              ),
                            ),
                            onLongPress: () => _confirmDelete(context, note.id),
                          );
                        },
                      )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NoteEditorScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
