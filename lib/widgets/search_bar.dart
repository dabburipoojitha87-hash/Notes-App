import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/notes_provider.dart';

class PixelSearchBar extends ConsumerWidget {
  const PixelSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: query)..selection = TextSelection.collapsed(offset: query.length),
        onChanged: (value) => ref.read(searchQueryProvider.notifier).updateState(value),
        decoration: InputDecoration(
          hintText: 'Search notes...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: query.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    ref.read(searchQueryProvider.notifier).updateState('');
                    FocusScope.of(context).unfocus();
                  },
                )
              : null,
        ),
      ),
    );
  }
}
