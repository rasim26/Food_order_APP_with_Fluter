import 'package:flutter/material.dart';

class OverlayInfo extends StatelessWidget {
  const OverlayInfo({super.key, required this.overlay, required this.pricing});
  final String overlay;
  final String pricing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          overlay,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white, // Changed to white for better contrast
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          '$pricing₹',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
