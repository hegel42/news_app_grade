part of '../feature.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NativeUtilsBloc, NativeUtilsState>(
      listener: (context, state) {
        if (state is NativeUtilsError) {
          showAppSnackBar(context, context.locale.defaultError, isError: true);
        }
      },
      buildWhen: (previous, current) => current is NativeUtilsDataState,
      builder: (context, state) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppFilledButton(
              onTap: () {
                context.read<NativeUtilsBloc>().add(GetSystemDetailsEvent());
              },
              buttonText: context.locale.getSystemDetails,
            ),
            const SizedBox(height: 20),
            if (state is NativeUtilsDataState)
              Text(
                state.systemSpecification ?? '',
                style: context.theme.textTheme
                    .ui14Semibold(context, context.theme.text),
              ),
            AppFilledButton(
              onTap: () {
                context.read<NativeUtilsBloc>().add(GetBatteryLevelEvent());
              },
              buttonText: context.locale.getBatteryLevel,
            ),
            if (state is NativeUtilsDataState) ...[
              const SizedBox(height: 20),
              if (state.bateryLevel?.isNotEmpty ?? false)
                Text(
                  '${state.bateryLevel ?? ''} %',
                  style: context.theme.textTheme
                      .ui18Semibold(context, context.theme.text),
                )
              else
                const SizedBox.shrink(),
            ],
          ],
        );
      },
    );
  }
}
