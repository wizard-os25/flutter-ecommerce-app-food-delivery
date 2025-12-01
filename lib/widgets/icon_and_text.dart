import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

class IconAndTextWidget extends StatefulWidget {

final IconData icon;
final String text;
final Color iconColor;
final Color? textColor;

  const IconAndTextWidget({
    super.key,
  required this.icon,
  required this.text,
  required this.iconColor,
  this.textColor = const Color(0xFFccc7c5),
  });

  @override
  State<IconAndTextWidget> createState() => _IconAndTextWidgetState();
}

class _IconAndTextWidgetState extends State<IconAndTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: widget.iconColor,
        ),
        const SizedBox(width: 8),
        SmallText(text: widget.text, color: widget.textColor),
      ],
    );
  }
}