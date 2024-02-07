import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/extensions/context_extension.dart';
import '../../../common/localization/provider/locale_provider.dart';
import 'bloc/home_screen_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(context.locale.helloWorld),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (state is HomeScreenInitial) const Text('initial state'),
                Text(
                  context.locale.centerText,
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    // context.read<LocaleManager>().updateLocale(context);
                    context.read<LocaleProvider>().setLocale(
                          const Locale('en'),
                        );
                  },
                  child: const Text('en'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // context.read<LocaleManager>().updateLocale(context);
                    context.read<LocaleProvider>().setLocale(
                          const Locale('ru'),
                        );
                  },
                  child: const Text('ru'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
