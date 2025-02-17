import 'package:connectify/library.dart';

class CustomButton extends StatelessWidget {
  const CustomButton.flat({
    required this.onPressed,
    required this.child,
    super.key,
    this.color,
    this.borderRadius,
    this.margin,
    this.padding,
    this.width,
    this.height,
  })  : type = CustomButtonType.flatButton,
        elevation = null,
        icon = null;

  const CustomButton.raised({
    required this.onPressed,
    required this.child,
    super.key,
    this.color,
    this.borderRadius,
    this.margin,
    this.padding,
    this.width,
    this.height,
  })  : type = CustomButtonType.raisedButton,
        elevation = 1,
        icon = null;

  /// for any button with icon
  const CustomButton.withIcon({
    required this.onPressed,
    required this.child,
    required this.icon,
    super.key,
    this.color,
    this.borderRadius,
    this.margin,
    this.padding,
    this.width,
    this.height,
  })  : type = CustomButtonType.withIconButton,
        elevation = null;

  final void Function() onPressed;
  final Widget child;
  final Color? color;
  final double? borderRadius;
  final IconData? icon;

  /// for shadow
  final double? elevation;
  final double? width;
  final double? height;

  /// for external space
  final EdgeInsets? margin;

  /// for internal space
  final EdgeInsets? padding;
  final CustomButtonType type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CustomButtonType.flatButton => _buildflat(),
      CustomButtonType.raisedButton => _buildRaised(),
      CustomButtonType.withIconButton => _buildWithIcon()
    };
  }

  Widget _buildflat() {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      padding: padding,
      height: height,
      child: child,
    );
  }

  Widget _buildRaised() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
      ),
      child: child,
    );
  }

  Widget _buildWithIcon() {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      padding: padding,
      height: height,
      child: child,
    );
  }
}

enum CustomButtonType {
  flatButton,
  raisedButton,
  withIconButton,
}
