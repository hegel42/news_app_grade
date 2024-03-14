part of 'agency_detailed_bloc.dart';

@immutable
sealed class AgencyDetailedState {}

final class AgencyDetailedInitial extends AgencyDetailedState {}

final class AgencyDetailedLoading extends AgencyDetailedState {}

final class AgencyDetailedData extends AgencyDetailedState {
  final List<Article> listArticles;

  AgencyDetailedData({required this.listArticles});
}

final class AgencyDetailedError extends AgencyDetailedState {}
