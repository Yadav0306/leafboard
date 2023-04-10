import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback onBackTap;
  final VoidCallback onSkipTap;

  MyAppBar({super.key, required this.onBackTap, required this.onSkipTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: TextButton(
        onPressed: onBackTap,
        child: const Text(
          '<Back',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: onSkipTap,
          child: const Text(
            'Skip>',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
