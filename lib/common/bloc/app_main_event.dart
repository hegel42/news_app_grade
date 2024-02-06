part of 'app_main_bloc.dart';

@immutable
sealed class MainBlocEvent {}

class AppStartedEvent extends MainBlocEvent {}

class NotifyListenersEvent extends MainBlocEvent {
  NotifyListenersEvent({
    this.needNavigateToProfile = false,
    required this.isAuthorized,
  });
  final bool isAuthorized;
  final bool needNavigateToProfile;
}

class ClearCurrentStackEvent extends MainBlocEvent {
  ClearCurrentStackEvent({this.stackIndex});
  final int? stackIndex;
}

class NavigateToOtherScreenEvent extends MainBlocEvent {
  NavigateToOtherScreenEvent({this.stackIndex, this.onSecondNavigate, this.withClearStack = false});
  final int? stackIndex;
  final String? onSecondNavigate;
  final bool withClearStack;
}
