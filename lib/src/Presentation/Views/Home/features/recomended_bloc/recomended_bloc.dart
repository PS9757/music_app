import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'recomended_event.dart';
part 'recomended_state.dart';

class RecommendedEmpty extends RecommendedState {
  @override
  List<Object> get props => [];
}

class RecommendedBloc extends Bloc<RecomendedEvent, RecommendedState> {
  RecommendedBloc() : super(RecommendedInitial()) {
    // Register the event handler for FetchRecommendedData
    on<FetchRecommendedData>((event, emit) async {
      emit(RecommendedLoading());
      try {
        final musicData = await getMusicCollection();
        if (musicData!.isNotEmpty) {
          emit(RecommendedLoaded(musicData));
        } else {
          emit(RecommendedEmpty());
        }
      } catch (e) {
        emit(RecommendedError('Error fetching recommended music data: $e'));
      }
    });
  }

  @override
  Stream<RecommendedState> mapEventToState(RecomendedEvent event) async* {
    if (event is FetchRecommendedData) {
      // The event handler for FetchRecommendedData is registered above.
    }
  }

  Future<List<Map<String, dynamic>>?> getMusicCollection() async {
    try {
      CollectionReference musicCollection =
      FirebaseFirestore.instance.collection('musicList');

      QuerySnapshot querySnapshot = await musicCollection.get();

      if (querySnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> musicList = [];

        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          musicList.add(document.data() as Map<String, dynamic>);
        }

        return musicList;
      } else {
        return [];
      }
    } catch (e) {
      throw 'Error fetching music collection: $e';
    }
  }
}
