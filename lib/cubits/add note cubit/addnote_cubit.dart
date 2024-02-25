import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());

  addNote(NoteModel note) {}
}
