part of 'agency_detailed_bloc.dart';

@immutable
sealed class AgencyDetailedEvent {}

final class AgencyDetailedFetchData extends AgencyDetailedEvent {
  AgencyDetailedFetchData({required this.source});
  final String source;
}
