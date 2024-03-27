// class NativeUtilsFeature {

// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../extensions/context_extension.dart';
import '../../main_theme/extensions/text_theme_extension.dart';
import '../../main_theme/extensions/theme_data_extension.dart';
import '../app_filled_button.dart';
import '../modals/app_snackbar.dart';
import 'bloc/native_utils_bloc.dart';
part 'components/native_utils.dart';

class NativeUtilsFeature extends StatelessWidget {
  const NativeUtilsFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NativeUtilsBloc(),
      child: const _Body(),
    );
  }
}
