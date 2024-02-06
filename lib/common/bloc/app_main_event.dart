part of 'app_main_bloc.dart';

@immutable
sealed class MainBlocEvent {}

class AppStartedEvent extends MainBlocEvent {}

class NotifyListenersEvent extends MainBlocEvent {
  final isAuthorized;
  final bool needNavigateToProfile;

  NotifyListenersEvent(this.isAuthorized, {this.needNavigateToProfile = false});
}

class ClearCurrentStackEvent extends MainBlocEvent {
  final int? stackIndex;
  ClearCurrentStackEvent({this.stackIndex});
}

class NavigateToOtherScreenEvent extends MainBlocEvent {
  final int? stackIndex;
  final String? onSecondNavigate;
  final bool withClearStack;

  NavigateToOtherScreenEvent({this.stackIndex, this.onSecondNavigate, this.withClearStack = false});
}
