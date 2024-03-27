part of 'native_utils_bloc.dart';

@immutable
sealed class NativeUtilsState {}

final class NativeUtilsInitial extends NativeUtilsState {}

final class NativeUtilsError extends NativeUtilsState {}

final class NativeUtilsDataState extends NativeUtilsState {
  NativeUtilsDataState({
    this.bateryLevel,
    this.systemSpecification,
  });

  final String? bateryLevel;

  final String? systemSpecification;
}
