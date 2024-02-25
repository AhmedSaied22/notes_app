import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
}
