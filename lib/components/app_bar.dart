import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback onBackTap;
  final VoidCallback onSkipTap;

  MyAppBar({super.key, required this.onBackTap, required this.onSkipTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
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
