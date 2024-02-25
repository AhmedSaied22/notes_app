part of 'addnote_cubit.dart';

@immutable
abstract class AddnoteState {}

final class AddnoteInitial extends AddnoteState {}

final class AddnoteLoading extends AddnoteState {}

final class AddnoteSuccess extends AddnoteState {}

final class AddnoteFailure extends AddnoteState {
  final String errMessage;

  AddnoteFailure(this.errMessage);
}

// Creating a Cubit for every process as a principle of single responsibility.