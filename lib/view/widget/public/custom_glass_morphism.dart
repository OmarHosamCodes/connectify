import 'package:connectify/library.dart';

class CustomGlassMorphismContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final BorderRadius? borderRadius;
  final Color color;
  final double opacity;

  const CustomGlassMorphismContainer({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.borderRadius,
    this.color = Colors.white,
    this.opacity = 0.3,
  });

  BorderRadius get _borderRadius =>
      borderRadius ?? BorderRadius.circular(SimpleConstants.radius);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: color.withOpacity(opacity),
          ),
          child: child,
        ),
      ),
    );
  }
}
