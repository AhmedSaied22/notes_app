part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

// class NotesLoading extends NotesState {}

// class NotesSuccess extends NotesState {
//   final List<NoteModel> notes;
// /* It is possible to put this list in a cubit, but I would only do this if my data exists 'distributed'
// in more than one widget. In that case, I would need to pass this list to every 
// widget related to it. However, since there is only one ListView available here, 
// I can work on it at one time, directly, so i put it in here, in success state.*/

//   NotesSuccess(this.notes);
// }


// // Creating a Cubit for every process as a principle of single responsibility.