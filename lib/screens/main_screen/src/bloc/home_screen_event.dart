part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class FetchHotNews extends HomeScreenEvent {}
