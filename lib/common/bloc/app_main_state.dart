part of 'app_main_bloc.dart';

@immutable
sealed class MainBlocState {}

class AppMainInitial extends MainBlocState {}

class AppMainHomeScreen extends MainBlocState {}

class SplashState extends MainBlocState {}

class MainErrorState extends MainBlocState {
  MainErrorState({required this.message});

  final String message;
}

class RegionChangeState extends MainBlocState {
  RegionChangeState({required this.regionCode});

  final String regionCode;
}
