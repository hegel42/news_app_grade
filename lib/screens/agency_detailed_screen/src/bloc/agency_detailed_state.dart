part of 'agency_detailed_bloc.dart';

@immutable
sealed class AgencyDetailedState {}

final class AgencyDetailedInitial extends AgencyDetailedState {}

final class AgencyDetailedLoading extends AgencyDetailedState {}

final class AgencyDetailedData extends AgencyDetailedState {
  AgencyDetailedData({required this.listArticles});
  final List<Article> listArticles;
}

final class AgencyDetailedError extends AgencyDetailedState {}
