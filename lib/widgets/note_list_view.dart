import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/note_item.dart';

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
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.noHeader,
                      animType: AnimType.scale,
                      title: 'Warning',
                      desc: 'Are you sure for deleting this note?',
                      btnOkOnPress: () {
                        notes[index].delete();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                              left: 50,
                              right: 50,
                            ),
                            backgroundColor: kPrimaryColor,
                            content: const Center(
                                child: Text(
                              'Note deleted',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                          ),
                        );
                        BlocProvider.of<NotesCubit>(context).fetchAllNote();
                      },
                      btnCancelOnPress: () {
                        BlocProvider.of<NotesCubit>(context).fetchAllNote();
                      },
                      btnCancelText: 'Cancel',
                      btnOkText: 'Delete',
                      titleTextStyle:
                          const TextStyle(color: kPrimaryColor, fontSize: 22),
                      descTextStyle:
                          TextStyle(color: Colors.white.withOpacity(0.8)),
                    ).show();
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
}
