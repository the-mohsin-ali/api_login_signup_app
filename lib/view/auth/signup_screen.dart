import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:api_login_signup_app/view/auth/login_screen.dart';
import 'package:api_login_signup_app/widgets/rouded_button.dart';
import 'package:http/http.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  // Controllers for the text fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signup(String email, String password) async {
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/signup'),
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': 'reqres-free-v1',
          },
          body: jsonEncode(
            {
              'email': email,
              'password': password,
            },
          ));

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup Successful!')),
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        throw Exception('Failed to signup');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup Failed: $e')),
      );
      if (kDebugMode) {
        print("Problem $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: Navigator.of(context).pop,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Signup Screen',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          // border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // You can add more validation logic here if needed
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          // border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter your password'
                            : null,
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedButton(
                title: 'Signup',
                onTap: () => {
                  if (formKey.currentState!.validate())
                    {signup(emailController.text, passwordController.text)}
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?',
                    style: TextStyle(fontSize: 16)),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                    )),
              ],
            ),
          ],
        ));
  }
}
