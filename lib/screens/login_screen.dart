import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter Name',
                    hintText: 'Enter Your Name'),
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter Password',
                    hintText: 'Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
