part of 'app_main_bloc.dart';

@immutable
sealed class MainBlocState {}

class AppMainInitial extends MainBlocState {}

class SplashState extends MainBlocState {}

class NotifyListeners extends MainBlocState {
  NotifyListeners({required this.isAuthorized});
  final bool isAuthorized;
}

class ClearCurrentStackState extends MainBlocState {
  ClearCurrentStackState({this.stackIndex});
  final int? stackIndex;
}

class NavigateToOtherScreenState extends MainBlocState {
  NavigateToOtherScreenState({
    this.stackIndex,
    this.onSecondNavigate,
    required this.withClearStack,
  });
  final int? stackIndex;
  final String? onSecondNavigate;
  final bool withClearStack;
}
