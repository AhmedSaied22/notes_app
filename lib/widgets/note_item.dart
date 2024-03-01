import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/widgets/snake_case.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: note,
            );
          }));
        },
        child: Container(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 24,
              left: 16,
            ),
            decoration: BoxDecoration(
                color: Color(note.color),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.only(right: 16, left: 16, top: 8),
                  title: RichText(
                    maxLines: 1,
                    text: TextSpan(
                      text: note.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text: note.subTitle,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 18),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      awesomeDialog(context);
                    },
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
                    note.date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void awesomeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      title: 'Warning',
      desc: 'Are you sure for deleting this note?',
      btnOkOnPress: () {
        note.delete();
        snackBar(context);
        BlocProvider.of<NotesCubit>(context).fetchAllNote();
      },
      btnCancelOnPress: () {
        BlocProvider.of<NotesCubit>(context).fetchAllNote();
      },
      btnCancelText: 'Cancel',
      btnOkText: 'Delete',
      titleTextStyle: const TextStyle(color: kPrimaryColor, fontSize: 22),
      descTextStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
    ).show();
  }
}
