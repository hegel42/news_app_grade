import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/source.dart';
import '../../data/repository/repository.dart';
import 'src/agency_detailed_screen.dart';
import 'src/bloc/agency_detailed_bloc.dart';

CupertinoPageRoute agencyDetailedScreenRoute(Source source) {
  return CupertinoPageRoute(
    builder: (context) => BlocProvider<AgencyDetailedBloc>(
      create: (context) => AgencyDetailedBloc(
        context.read<Repository>(),
      )..add(AgencyDetailedFetchData(source: source.id)),
      child: AgencyDetailScreen(source: source),
    ),
  );
}
