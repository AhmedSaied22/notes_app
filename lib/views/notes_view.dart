import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/widgets/note_view_body.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (BuildContext context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: Icon(Icons.note_add),
      ),
      body: const NoteViewBody(),
    );
  }
}
