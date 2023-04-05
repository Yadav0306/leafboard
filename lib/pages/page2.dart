import 'package:flutter/material.dart';
import 'package:leaf/components/app_bar.dart';
import 'home_page.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String _selectedOption = '';
  bool _canProceed = false;

  void _handleOptionSelect(String option) {
    setState(() {
      _selectedOption = option;
      _canProceed = true;
    });
  }

  void _handleNextButtonPressed() {
    if (_canProceed) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        onBackTap: () => Navigator.of(context).pop(),
        onSkipTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: const AssetImage('lib/images/logo.png'),
              ),
              const SizedBox(height: 30),
              const Text(
                'What is your role?',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 17, 27, 49),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              _buildOption('Marketing'),
              const SizedBox(height: 16.0),
              _buildOption('Developer'),
              const SizedBox(height: 16.0),
              _buildOption('Designer'),
              const SizedBox(height: 16.0),
              _buildOption('Management'),
              const SizedBox(height: 32.0),
              nextButton(),
              const SizedBox(height: 150.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/logo.png',
                    height: 35,
                    width: 35,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Leafboard',
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 27, 49),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String option) {
    bool isSelected = _selectedOption == option;
    return InkWell(
      onTap: () => _handleOptionSelect(option),
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

  Widget nextButton() {
    return InkWell(
      onTap: _handleNextButtonPressed,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: _selectedOption == ''
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
                    color: _canProceed ? Colors.grey[800] : Colors.grey[500],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: _canProceed ? Colors.grey[800] : Colors.grey[500],
                size: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
