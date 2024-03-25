part of 'app_main_bloc.dart';

@immutable
sealed class MainBlocEvent {}

class AppStartedEvent extends MainBlocEvent {}

class ChangeNewsRegion extends MainBlocEvent {
  ChangeNewsRegion({required this.regionCode});

  final String regionCode;
}
