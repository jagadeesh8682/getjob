
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hasDivider;
  final VoidCallback? onEdit;

  const ProfileSection({
    super.key,
    required this.title,
    required this.child,
    this.hasDivider = true,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (onEdit != null)
              IconButton(
                icon: const Icon(Icons.edit, size: 18, color: Color(0xFF486DF5)),
                onPressed: onEdit,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
          ],
        ),
        const SizedBox(height: 16),
        child,
        if (hasDivider) ...[
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
