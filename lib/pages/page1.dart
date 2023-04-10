import 'package:flutter/material.dart';
import 'package:leaf/components/app_bar.dart';
import 'package:leaf/components/logo.dart';
import 'package:leaf/pages/page2.dart';
import '../components/next_button.dart';
import '../components/option_builder.dart';
import 'home_page.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
            return const Page2();
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
                'Let\'s create your profile',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 17, 27, 49),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'What will you use it for?',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 17, 27, 49),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              OptionBuilder.build('Work', _selectedOption, _handleOptionSelect),
              const SizedBox(height: 16.0),
              OptionBuilder.build(
                  'Personal', _selectedOption, _handleOptionSelect),
              const SizedBox(height: 16.0),
              OptionBuilder.build(
                  'School', _selectedOption, _handleOptionSelect),
              const SizedBox(height: 32.0),
              nextButton(
                  _selectedOption, _canProceed, _handleNextButtonPressed),
              const SizedBox(height: 150.0),
              const Logo(),
            ],
          ),
        ),
      ),
    );
  }
}
