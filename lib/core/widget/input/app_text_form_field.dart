import "dart:async";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../../base/bloc/mixin/theme_mixin.dart";
import "../../theme/theme.dart";

/// If you making a `AppTextFormField` where you require save, reset, or validate
class AppTextFormField extends TextField {
  /// Create a AppTextFormField
  const AppTextFormField({
    super.key,
    // Form
    this.fieldKey,
    super.restorationId,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
    // Text field
    super.controller,
    super.focusNode,
    super.keyboardType = TextInputType.text,
    super.textInputAction,
    super.textCapitalization = TextCapitalization.sentences,
    super.style = AppStyles.s14w400Inter,
    super.textAlign = TextAlign.start,
    super.textAlignVertical = TextAlignVertical.center,
    super.textDirection,
    super.readOnly = false,
    super.showCursor = true,
    super.autofocus = false,
    super.autocorrect = true,
    super.obscureText = false,
    super.enableSuggestions = true,
    super.enabled,
    super.minLines,
    super.maxLength = 200,
    super.onChanged,
    this.onEditingEnd,
    this.onFocusChange,
    super.onEditingComplete,
    super.onTap,
    super.inputFormatters,
    // Decoration
    this.fillColor,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.label,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.suffixIconConstraints = const BoxConstraints(maxHeight: 24),
    this.prefixIconConstraints = const BoxConstraints(maxHeight: 24),
    super.decoration = null,
    this.contentPadding = const EdgeInsets.all(10),
    this.isDense = true,
    // Scroll
    super.expands = false,
    super.maxLines = 1,
    super.scrollController,
    super.scrollPhysics,
  });

  /// Decoration: The base fill color of the decoration's container color.
  final Color? fillColor;

  /// Decoration: Optional widget to place on the line before the input.
  final Widget? prefix;

  /// Decoration: An icon that appears before the [prefix] and before the editable part of the text field, within the decoration's container.
  final Widget? prefixIcon;

  /// Decoration: Optional widget to place on the line after the input.
  final Widget? suffix;

  /// Decoration: An icon that appears after the editable part of the text field and after the [suffix], within the decoration's container.
  final Widget? suffixIcon;

  /// Decoration: Optional widget that describes the input field.
  final Widget? label;

  /// Decoration: Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Decoration: Text that appears below the [InputDecorator.child] and the border.
  final String? errorText;

  /// Decoration: The constraints for the suffix icon.
  final BoxConstraints? suffixIconConstraints;

  /// Decoration: The constraints for the prefix icon.
  final BoxConstraints? prefixIconConstraints;

  /// Decoration: The padding for the input decoration's container.
  final EdgeInsets? contentPadding;

  /// Decoration: Whether the [InputDecorator.child] is part of a dense form (i.e., uses less vertical space).
  final bool isDense;

  /// Form: The current state of a [FormField]. Passed to the [FormFieldBuilder] method for use in constructing the form field's widget.
  final GlobalKey<FormFieldState<String>>? fieldKey;

  /// Form: An optional value to initialize the form field to, or null otherwise.
  final String? initialValue;

  /// Form: An optional method that validates an input. Returns an error string to display if the input is invalid, or null otherwise.
  final FormFieldValidator<String>? validator;

  /// Form: An optional method to call with the final value when the form is saved via [FormState.save].
  final FormFieldSetter<String>? onSaved;

  /// Form: An optional method to call with the final value when the form is saved via user submit.
  final ValueChanged<String>? onFieldSubmitted;

  /// Form: An optional method to call with the final value when the form is saved via user end input.
  final ValueChanged<String>? onEditingEnd;

  /// Form: An optional method to call with the final value when the form is saved via user change forcus field.
  final ValueChanged<bool>? onFocusChange;

  @override
  State<AppTextFormField> createState() => AppTextFormFieldState<AppTextFormField>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty("fillColor", fillColor))
      ..add(DiagnosticsProperty<Widget?>("prefix", prefix))
      ..add(DiagnosticsProperty<Widget?>("prefixIcon", prefixIcon))
      ..add(DiagnosticsProperty<Widget?>("suffix", suffix))
      ..add(DiagnosticsProperty<Widget?>("suffixIcon", suffixIcon))
      ..add(DiagnosticsProperty<Widget?>("label", label))
      ..add(StringProperty("hintText", hintText))
      ..add(StringProperty("errorText", errorText))
      ..add(DiagnosticsProperty<BoxConstraints?>("suffixIconConstraints", suffixIconConstraints))
      ..add(DiagnosticsProperty<BoxConstraints?>("prefixIconConstraints", prefixIconConstraints))
      ..add(DiagnosticsProperty<EdgeInsets?>("contentPadding", contentPadding))
      ..add(DiagnosticsProperty<bool>("isDense", isDense))
      ..add(DiagnosticsProperty<GlobalKey<FormFieldState<String>>?>("fieldKey", fieldKey))
      ..add(StringProperty("initialValue", initialValue))
      ..add(ObjectFlagProperty<FormFieldValidator<String>?>.has("validator", validator))
      ..add(ObjectFlagProperty<FormFieldSetter<String>?>.has("onSaved", onSaved))
      ..add(ObjectFlagProperty<ValueChanged<String>?>.has("onFieldSubmitted", onFieldSubmitted))
      ..add(ObjectFlagProperty<ValueChanged<String>?>.has("onEditingEnd", onEditingEnd))
      ..add(ObjectFlagProperty<ValueChanged<bool>?>.has("onFocusChange", onFocusChange));
  }
}

/// The logic and internal state for a [AppTextFormField].
class AppTextFormFieldState<T extends AppTextFormField> extends State<T> with AppTextFormFieldHandle<T>, ThemeMixin<T> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      onChanged: onFieldChange,
      onTap: onTap,
      decoration: buildDecoration(context),
      obscuringCharacter: "*",
      cursorColor: colorScheme.onBackground,
      showCursor: widget.showCursor,
      style: widget.style,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      enabled: widget.enabled,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: buildInputFormatters(context),
      // Scroll
      expands: widget.expands,
      maxLines: widget.maxLines,
      scrollController: widget.scrollController,
      scrollPhysics: widget.scrollPhysics,
      // Form
      onSaved: widget.onSaved,
      validator: buildValidator(context),
      restorationId: widget.restorationId,
      autovalidateMode: AutovalidateMode.disabled,
    );
  }

  /// Custom validator when extend class
  FormFieldValidator<String>? buildValidator(BuildContext context) => widget.validator;

  /// Custom formatters when extend class
  List<TextInputFormatter>? buildInputFormatters(BuildContext context) => widget.inputFormatters;

  /// Custom obscureText when extend class
  bool get obscureText => widget.obscureText;

  /// Custom decoration when extend class
  InputDecoration buildDecoration(BuildContext context) {
    if (widget.decoration != null) {
      return widget.decoration!;
    }

    return InputDecoration(
      prefix: widget.prefix,
      prefixIcon: widget.prefixIcon,
      prefixIconConstraints: widget.prefixIconConstraints,
      suffix: widget.suffix,
      suffixIcon: widget.suffixIcon,
      contentPadding: widget.contentPadding,
      counterText: "",
      filled: true,
      isDense: widget.isDense,
      suffixIconConstraints: widget.suffixIconConstraints,
      fillColor: widget.fillColor ?? appThemes.appColors.background,
      hintText: widget.hintText,
      errorMaxLines: 2,
      errorText: widget.errorText,
      label: widget.label,
      labelStyle: widget.style,
      floatingLabelStyle: widget.style,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>("obscureText", obscureText));
  }
}

/// Handle form input text field
mixin AppTextFormFieldHandle<T extends AppTextFormField> on State<T> {
  FocusNode? _focusNode;
  Timer? _debounce;
  TextEditingController? _controller;

  /// Key [FormFieldState]
  GlobalKey<FormFieldState<String>>? fieldKey;

  /// The current state of a [FormField]. Passed to the [FormFieldBuilder] method for use in constructing the form field's widget
  FormFieldState<String>? get fieldState => fieldKey?.currentState;

  /// An object that can be used by a stateful widget to obtain the keyboard focus and to handle keyboard events.
  FocusNode get focusNode => widget.focusNode ?? (_focusNode ??= FocusNode());

  /// A controller for an editable text field.
  TextEditingController get controller {
    return widget.controller ?? (_controller ??= TextEditingController(text: widget.initialValue));
  }

  @override
  void initState() {
    fieldKey ??= widget.fieldKey ?? GlobalKey<FormFieldState<String>>();
    super.initState();
    focusNode.addListener(onFocusChange);
    controller.addListener(onControllerChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    controller.removeListener(onControllerChange);
    super.dispose();
    _focusNode?.dispose();
    _debounce?.cancel();
    _controller?.dispose();
  }

  /// Action when text field change forcus
  void onFocusChange() {
    if (!focusNode.hasFocus) {
      setState(() => fieldState?.validate());
    }
    widget.onFocusChange?.call(focusNode.hasFocus);
  }

  /// Action when controller change text
  void onControllerChange() {
    fieldState?.didChange(controller.text);
    if (fieldState?.isValid ?? false) {
      setState(() => fieldState?.validate());
    }
  }

  /// Action when text field change text
  void onFieldChange(String value) {
    widget.onChanged?.call(value);
    if (fieldState?.isValid ?? false) {
      setState(() => fieldState?.validate());
    }
    if (widget.onEditingEnd != null) {
      if (_debounce?.isActive ?? false) {
        _debounce!.cancel();
      }
      _debounce = Timer(AppParams.delayInputEnd, () {
        widget.onEditingEnd!(fieldState?.value ?? "");
      });
    }
  }

  /// Action when text field tap
  void onTap() => widget.onTap?.call();
}
