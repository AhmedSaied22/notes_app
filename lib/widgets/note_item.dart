import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/widgets/edit_note_body.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EditNoteView();
        }));
      },
      child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 16,
          ),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.only(right: 16, left: 16, top: 8),
                title: const Text(
                  'Flutter Tips',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 27),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'here\'s your details for this note',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 18),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  '22 Feb 2024',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
