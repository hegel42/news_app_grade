part of 'app_main_bloc.dart';

@immutable
sealed class MainBlocState {}

class AppMainInitial extends MainBlocState {}

class SplashState extends MainBlocState {}

class NotifyListeners extends MainBlocState {
  final bool isAuthorized;

  NotifyListeners(this.isAuthorized);
}

class ClearCurrentStackState extends MainBlocState {
  final int? stackIndex;

  ClearCurrentStackState({this.stackIndex});
}

class NavigateToOtherScreenState extends MainBlocState {
  final int? stackIndex;
  final String? onSecondNavigate;
  final bool withClearStack;

  NavigateToOtherScreenState({this.stackIndex, this.onSecondNavigate, required this.withClearStack});
}
