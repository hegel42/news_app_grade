part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class FetchHomeDataEvent extends HomeScreenEvent {}

class LoadNextEvent extends HomeScreenEvent {}
