import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/note_item.dart';
import 'package:note_app/widgets/snake_case.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: kSecondaryColor,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    awesomeDialog(context, notes, index);
                    BlocProvider.of<NotesCubit>(context).fetchAllNote();
                  },
                  child: NoteItem(
                    note: notes[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void awesomeDialog(BuildContext context, List<NoteModel> notes, int index) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      title: 'Warning',
      desc: 'Are you sure for deleting this note?',
      btnOkOnPress: () {
        notes[index].delete();
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
