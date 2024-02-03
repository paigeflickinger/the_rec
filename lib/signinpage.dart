import 'package:flutter/material.dart';
import 'welcomepage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => SignInState();
}

class SignInState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Logo Section
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('images/TheRec.png', width: 300, height: 300),
              Positioned(
                top: 150,
                child: Image.asset('images/TheRecIcon.png',
                    width: 150, height: 150),
              ),
            ],
          ),
          const SizedBox(
              height: 40), // Adjust the spacing between images and text fields

          // Email and Password Text Fields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Email', labelStyle: TextStyle(fontSize: 30)),
                  controller: emailController,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 30)),
                  controller: passController,
                  obscureText: true,
                  obscuringCharacter: '●',
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),

          // Sign In Button
          ElevatedButton(
            onPressed: () {
              if (emailController.text == 'paige@lsu.edu' &&
                  passController.text == 'paige') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text('Incorrect Email or Password'),
                    );
                  },
                );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              textStyle: const TextStyle(fontSize: 24),
            ),
            child: const Text('Sign In'),
          ),

          const SizedBox(height: 30),

          // Sign Up Button
          TextButton(
            onPressed: () {
              // Navigate to the Sign Up Page
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              textStyle: const TextStyle(fontSize: 24),
            ),
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
