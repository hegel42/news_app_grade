part of 'native_utils_bloc.dart';

@immutable
sealed class NativeUtilsEvent {}

class GetBatteryLevelEvent extends NativeUtilsEvent {}

class GetSystemDetailsEvent extends NativeUtilsEvent {}
