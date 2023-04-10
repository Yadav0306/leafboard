import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/images/logo.png',
          height: 35,
          width: 35,
        ),
        const Text(
          'Leafboard',
          style: TextStyle(
            color: Color.fromARGB(255, 17, 27, 49),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
