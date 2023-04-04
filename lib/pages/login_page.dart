import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leaf/pages/page1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _canProceed = false;
  bool _isObscure = true;
  final TextEditingController _myController1 = TextEditingController();
  final TextEditingController _myController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _myController1.text = '';
    _myController1.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _myController2.text = '';
    _myController2.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  @override
  void dispose() {
    _myController1.dispose();
    _myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 25),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Work without limits',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Your email address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _canProceed = _myController1.text.isNotEmpty &&
                          _myController2.text.isNotEmpty;
                    });
                  },
                  controller: _myController1,
                  cursorWidth: 1,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'dy22900@gmail.com',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1.25,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Choose a password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _canProceed = _myController1.text.isNotEmpty &&
                          _myController2.text.isNotEmpty;
                    });
                  },
                  controller: _myController2,
                  obscureText: _isObscure,
                  cursorWidth: 1,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure =
                                !_isObscure; // toggle password visibility
                          });
                        },
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color:
                              _isObscure ? Colors.grey.shade400 : Colors.black,
                        ),
                      ),
                    ),
                    hintText: 'min. 8 characters',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        width: 1.25,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                InkWell(
                  onTap: _canProceed
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            // Navigate to the next page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Page1(),
                              ),
                            );
                          }
                        }
                      : null,
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: (_myController1.text.isEmpty ||
                              _myController2.text.isEmpty)
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
                              'Continue',
                              style: TextStyle(
                                color: (_myController1.text.isEmpty ||
                                        _myController2.text.isEmpty)
                                    ? Colors.grey[500]
                                    : Colors.grey[800],
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: (_myController1.text.isEmpty ||
                                    _myController2.text.isEmpty)
                                ? Colors.grey[500]
                                : Colors.grey[800],
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                //or continue with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12.5),
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
