import 'package:bloc/bloc.dart';

enum SearchBarFocusEvent { focus, unfocus }

class SearchBarFocusBloc extends Bloc<SearchBarFocusEvent, bool> {
  SearchBarFocusBloc() : super(false) {
    on<SearchBarFocusEvent>((event, emit) async {
      if (event == SearchBarFocusEvent.focus) {
        emit(true); // Search bar focusedFF
      } else if (event == SearchBarFocusEvent.unfocus) {
        emit(false); // Search bar unfocused
      }
    });
  }

  @override
  void onEvent(SearchBarFocusEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
  }
}
