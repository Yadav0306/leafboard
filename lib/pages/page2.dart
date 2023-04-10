import 'package:flutter/material.dart';
import 'package:leaf/components/app_bar.dart';
import 'package:leaf/components/logo.dart';
import '../components/next_button.dart';
import '../components/option_builder.dart';
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
              OptionBuilder.build(
                  'Marketing', _selectedOption, _handleOptionSelect),
              const SizedBox(height: 16.0),
              OptionBuilder.build(
                  'Developer', _selectedOption, _handleOptionSelect),
              const SizedBox(height: 16.0),
              OptionBuilder.build(
                  'Designer', _selectedOption, _handleOptionSelect),
              const SizedBox(height: 16.0),
              OptionBuilder.build(
                  'Management', _selectedOption, _handleOptionSelect),
              const SizedBox(height: 32.0),
              nextButton(
                  _selectedOption, _canProceed, _handleNextButtonPressed),
              const SizedBox(height: 75.0),
              const Logo(),
            ],
          ),
        ),
      ),
    );
  }
}
