import 'package:flutter/material.dart';

class OptionBuilder {
  static Widget build(String option, String selectedOption, Function(String) handleOptionSelect) {
    bool isSelected = selectedOption == option;
    return InkWell(
      onTap: () => handleOptionSelect(option),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 20.0,
                height: 20.0,
                margin: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color.fromARGB(255, 82, 222, 47)
                      : null,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.green : Colors.grey.shade300,
                    width: isSelected ? 0 : 2.0,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16.0,
                )
                    : null,
              ),
              Text(
                option,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isSelected ? Colors.black : Colors.grey.shade500,
                  fontWeight: isSelected ? FontWeight.w500 : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
