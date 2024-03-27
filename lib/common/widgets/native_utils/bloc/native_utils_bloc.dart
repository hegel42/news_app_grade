import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'native_utils_event.dart';
part 'native_utils_state.dart';

class NativeUtilsBloc extends Bloc<NativeUtilsEvent, NativeUtilsState> {
  NativeUtilsBloc() : super(NativeUtilsInitial()) {
    on<GetBatteryLevelEvent>(_getBattery);
    on<GetSystemDetailsEvent>(_getSystemDetails);
  }
  static const platform = MethodChannel('samples.myChannel');

  String? bateryLevel;

  String? systemDetails;

  FutureOr<void> _getSystemDetails(
      GetSystemDetailsEvent event, Emitter<NativeUtilsState> emit) async {
    try {
      final String result = await platform.invokeMethod('getSystemDetail');
      systemDetails = result;
      emit(
        NativeUtilsDataState(
          bateryLevel: bateryLevel,
          systemSpecification: systemDetails,
        ),
      );
    } catch (e) {
      Logger().e(e);
      emit(NativeUtilsError());
    }
  }

  FutureOr<void> _getBattery(
    GetBatteryLevelEvent event,
    Emitter<NativeUtilsState> emit,
  ) async {
    try {
      final result = await platform.invokeMethod('getBatteryLevel');
      bateryLevel = result.toString();
      emit(
        NativeUtilsDataState(
          bateryLevel: bateryLevel,
          systemSpecification: systemDetails,
        ),
      );
    } catch (e) {
      Logger().e(e);
      emit(NativeUtilsError());
    }
  }
}
