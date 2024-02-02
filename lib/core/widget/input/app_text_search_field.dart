import 'package:flutter/material.dart';

import '../../base/bloc/mixin/theme_mixin.dart';
import 'app_text_form_field.dart';

class AppTextSearchField extends AppTextFormField implements PreferredSizeWidget {
  const AppTextSearchField({
    super.key,
    super.onFieldSubmitted,
    super.hintText,
    this.hintStyle,
    super.suffixIcon,
    super.suffixIconConstraints,
    this.height = 40.0,
  });

  final TextStyle? hintStyle;
  final double height;

  @override
  State<AppTextSearchField> createState() => _AppTextSearchFieldState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppTextSearchFieldState extends AppTextFormFieldState<AppTextSearchField> with ThemeMixin<AppTextSearchField> {
  @override
  InputDecoration buildDecoration(BuildContext context) {
    return super.buildDecoration(context).copyWith(
          fillColor: appThemes.appColors.background,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: super.build(context)),
        const SizedBox(width: 6),
        ElevatedButton(
          onPressed: () => widget.onFieldSubmitted?.call(controller.text),
          child: Text(l10n.search),
        )
      ],
    );
  }
}
