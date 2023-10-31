part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Map<String, dynamic>> musicData; // Adjust the data type accordingly

  HomeLoaded(this.musicData);
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}
