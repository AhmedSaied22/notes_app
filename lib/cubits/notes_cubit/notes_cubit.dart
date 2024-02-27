import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesStateCubit extends Cubit<NotesState> {
  NotesStateCubit() : super(NotesInitial());
}
