import 'package:flutter/material.dart';

Widget nextButton(
    String selectedOption, bool canProceed, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: selectedOption == ''
            ? Colors.grey[200]
            : const Color.fromARGB(255, 167, 253, 132),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Next',
                style: TextStyle(
                  color: canProceed ? Colors.grey[800] : Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: canProceed ? Colors.grey[800] : Colors.grey[500],
              size: 12,
            ),
          ),
        ],
      ),
    ),
  );
}