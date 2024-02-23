import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../../base/bloc/mixin/theme_mixin.dart";
import "app_text_form_field.dart";

/// Text field search with button search
class AppTextSearchField extends AppTextFormField {
  /// Create an AppTextSearchField
  const AppTextSearchField({
    super.key,
    super.onFieldSubmitted,
    super.hintText,
    this.hintStyle,
    super.suffixIcon,
    super.suffixIconConstraints,
  });

  /// The style to use for the [hintText].
  final TextStyle? hintStyle;

  @override
  State<AppTextSearchField> createState() => _AppTextSearchFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle?>("hintStyle", hintStyle));
  }
}

class _AppTextSearchFieldState extends AppTextFormFieldState<AppTextSearchField> with ThemeMixin<AppTextSearchField> {
  @override
  InputDecoration buildDecoration(BuildContext context) {
    return super.buildDecoration(context).copyWith(
          fillColor: appThemes.appColors.background,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintStyle: widget.hintStyle,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: super.build(context)),
        const SizedBox(width: 6),
        ElevatedButton(onPressed: onFieldSubmitted, child: Text(l10n.search))
      ],
    );
  }

  /// Action when button submit
  void onFieldSubmitted() {
    if (fieldState?.validate() ?? false) {
      widget.onFieldSubmitted?.call(controller.text);
    }
    focusNode.unfocus();
  }
}
