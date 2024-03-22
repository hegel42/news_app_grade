import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';
import '../main_theme/color_palette.dart';
import '../main_theme/extensions/text_theme_extension.dart';
import '../main_theme/extensions/theme_data_extension.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.onChange,
    required this.hintText,
    this.focus,
  });

  final Function(String?) onChange;
  final String hintText;
  final FocusNode? focus;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController controller = TextEditingController();

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: ColorPalette.border),
  );
  bool isSearchEnabled = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isSearchEnabled = controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: context.theme.text,
      controller: controller,
      focusNode: widget.focus,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) => widget.onChange.call(value),
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () {},
          // TODO icon
          icon: const Icon(Icons.search),
        ),
        suffixIcon: isSearchEnabled
            ? IconButton(
                onPressed: () {
                  controller.clear();
                  widget.onChange.call('');
                },
                icon: const Icon(Icons.cancel),
              )
            : null,
        filled: true,
        contentPadding: const EdgeInsets.all(0),
        hintStyle: context.theme.textTheme.ui14Regular(
          context,
          context.theme.accentSecondary,
        ),
        hintText: widget.hintText,
        focusedBorder: border,
        focusedErrorBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: border,
        labelStyle: context.theme.textTheme.ui14Regular(
          context,
          context.theme.text,
        ),
      ),
    );
  }
}
