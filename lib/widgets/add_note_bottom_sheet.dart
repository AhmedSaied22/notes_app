import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 32,
        ),
        CustomTextField(
          hintText: 'Title',
        ),
        SizedBox(
          height: 16,
        ),
        CustomTextField(
          hintText: 'Content',
          maxLines: 6,
        ),
      ],
    );
  }
}
