import 'package:connectify/library.dart';

/// A custom text field widget for Quantum Muscle app.
class CustomTextField extends StatelessWidget {
  /// Creates a [CustomTextField].
  ///
  /// The [controller], [hintText], and [textInputAction]
  ///  parameters are required.
  /// The [obscureText], [keyboardType], [validator],
  /// [isExpanded], [initialValue],
  /// [maxLength], [borderRadius], [margin], [fontSize],
  /// [fieldColor], [onChanged],
  /// and [onEditingComplete] parameters are optional.
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    super.key,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.isExpanded = false,
    this.initialValue,
    this.maxLength,
    this.borderRadius,
    this.margin,
    this.fontSize = 16.0,
    this.fieldColor = const Color(0xFF00695C),
    this.onChanged,
    this.onEditingComplete,
  });

  /// The controller for the text field.
  final TextEditingController controller;

  /// The hint text to display when the text field is empty.
  final String hintText;

  /// Whether the text should be obscured (e.g., for password input).
  final bool obscureText;

  /// An optional function to validate the input value.
  final String? Function(String?)? validator;

  /// The type of keyboard to use for input.
  final TextInputType? keyboardType;

  /// Whether the text field should expand to fill available space.
  final bool isExpanded;

  /// The initial value of the text field.
  final String? initialValue;

  /// The maximum number of characters allowed in the text field.
  final int? maxLength;

  /// The border radius of the text field.
  final BorderRadius? borderRadius;

  /// The margin around the text field.
  final EdgeInsets? margin;

  /// The font size of the text field.
  final double? fontSize;

  /// The color of the text field.
  final Color fieldColor;

  /// A callback function that is called when the text value changes.
  final void Function(String)? onChanged;

  /// A callback function that is called when editing is complete.
  final void Function()? onEditingComplete;

  /// The action to take when the user submits the text field.
  final TextInputAction textInputAction;

  /// Returns the border radius value for the text field.
  BorderRadius get borderRadiusValue {
    if (borderRadius != null) {
      return borderRadius!;
    }
    return BorderRadius.circular(10);
  }

  /// Returns the outline input border for the text field.
  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: borderRadiusValue,
        borderSide: BorderSide(
          color: fieldColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      strutStyle: const StrutStyle(height: 1),
      maxLength: maxLength,
      smartDashesType: SmartDashesType.enabled,
      smartQuotesType: SmartQuotesType.enabled,
      expands: isExpanded,
      keyboardType: keyboardType,
      style: TextStyle(
        color: const Color(0xFFF1F8E9),
        fontSize: fontSize,
      ),
      textAlignVertical: TextAlignVertical.top,
      maxLines: isExpanded ? null : 1,
      cursorColor: const Color(0xFFF1F8E9),
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        isCollapsed: false,
        errorStyle: const TextStyle(
          color: Color(0xFFF44336),
          fontSize: 14,
        ),
        counterText: '',
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        filled: true,
        fillColor: fieldColor.withOpacity(.2),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFF1F8E9)),
        contentPadding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
      ),
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
    );
  }
}
