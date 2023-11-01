import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app/Src/Presentation/Views/Home/features/recentlyplayed_bloc/recentlyplayed_event.dart';

import '../../../../../../main.dart';

part 'recentlyplayed_state.dart';

class RecentlyplayedBloc
    extends Bloc<RecentlyplayedEvent, RecentlyplayedState> {
  var list;

  RecentlyplayedBloc() : super(RecentlyplayedInitial()) {
    on<FetchRecentlyPlayedData>((event, emit) async {
      list = box.get("musictrack");
      emit(changedata(data: list));
    });
  }
}
