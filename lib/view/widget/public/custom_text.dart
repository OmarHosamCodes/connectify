import 'package:connectify/library.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    super.key,
    this.style = const TextStyle(
      fontSize: 15,
    ),
    this.isSeccoundary = false,
    this.isHeadline = false,
    this.color = Colors.black,
  });

  final String text;

  final TextStyle style;

  final bool isSeccoundary;

  final bool isHeadline;

  final Color? color;

  TextOverflow get overFlow => TextOverflow.ellipsis;

  double get fontSize {
    if (isSeccoundary) {
      return 16;
    } else if (isHeadline) {
      return 20;
    } else {
      return style.fontSize!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        overflow: overFlow,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
