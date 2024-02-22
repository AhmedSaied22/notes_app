import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, build) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: NoteItem(),
        );
      },
    );
  }
}
