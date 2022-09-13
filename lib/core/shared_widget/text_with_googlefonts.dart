import 'package:flutter/material.dart';

class TextStyleGenerator extends StatelessWidget {
  final String? text;
  final TextStyle? style;

  // ignore: use_key_in_widget_constructors
  const TextStyleGenerator({
    @required this.text,
    this.style,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: style,
    );
  }
}
