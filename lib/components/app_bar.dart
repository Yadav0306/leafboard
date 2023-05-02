import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback onBackTap;
  final VoidCallback onSkipTap;

  MyAppBar({super.key, required this.onBackTap, required this.onSkipTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: onBackTap,
            child: const Text('< Back'),
          ),
          MaterialButton(
            onPressed: onSkipTap,
            child: const Text('Skip >'),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
