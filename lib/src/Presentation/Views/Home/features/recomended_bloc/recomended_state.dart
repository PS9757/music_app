part of 'recomended_bloc.dart';

@immutable
abstract class RecommendedState {}

class RecommendedInitial extends RecommendedState {}

class RecommendedLoading extends RecommendedState {}

class RecommendedLoaded extends RecommendedState {
  final List<Map<String, dynamic>> musicData;// Adjust the data type accordingly
  List<AudioTrack> playlist = [];

  RecommendedLoaded(this.musicData, this.playlist);
}

class RecommendedError extends RecommendedState {
  final String error;

  RecommendedError(this.error);
}