import 'package:flutter/material.dart';
import 'package:flutterxy/utils/text_styles.dart';

class StandardButton extends StatelessWidget {
  const StandardButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size(125, height * 0.05)),
      onPressed: () {},
      child: SelectableText(
        label,
        style: TextStyles.buttonText,
      ),
    );
  }
}
