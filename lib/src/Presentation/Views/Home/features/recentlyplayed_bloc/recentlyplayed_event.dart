import 'package:flutter/cupertino.dart';

@immutable
abstract class RecentlyplayedEvent {}

class FetchRecentlyPlayedData extends RecentlyplayedEvent {
  // Event to fetch recently played data.
}

class ClearRecentlyPlayedData extends RecentlyplayedEvent {
  // Event to clear the recently played data, if needed.
}

class AddToRecentlyPlayed extends RecentlyplayedEvent {
  final  list; // Replace with your data type.

  AddToRecentlyPlayed(this.list);
}
