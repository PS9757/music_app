part of 'recentlyplayed_bloc.dart';

@immutable
abstract class RecentlyplayedState {}

class RecentlyplayedInitial extends RecentlyplayedState {}

class changedata extends RecentlyplayedState{
  var data;
  changedata({this.data});
}