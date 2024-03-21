import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/repository.dart';
import 'src/bloc/search_screen_bloc.dart';
import 'src/search_screen.dart';

CupertinoPageRoute searchScreenRoute(RouteSettings route) {
  return CupertinoPageRoute(
    settings: route,
    builder: (context) => BlocProvider(
      create: (context) => SearchScreenBloc(context.read<Repository>()),
      child: const SearchScreen(),
    ),
  );
}
