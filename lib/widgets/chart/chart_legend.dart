import 'package:flutter/material.dart';

class LegendItemWidget extends StatelessWidget {
  final String title;
  final Color color;

  const LegendItemWidget({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: const Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.black87, fontSize: 12),
        ),
      ],
    );
  }
}
