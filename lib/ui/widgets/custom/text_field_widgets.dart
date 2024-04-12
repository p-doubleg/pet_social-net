import 'package:flutter/material.dart';

class EmailTextFieldWidget extends StatelessWidget {
  const EmailTextFieldWidget({
    super.key,
    required this.emailTextController,
  });

  final TextEditingController emailTextController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailTextController,
      cursorColor: const Color(0xFF436BF1),
      decoration: const InputDecoration(
        labelText: 'Email address',
        floatingLabelStyle: TextStyle(color: Color(0xFF2688EB)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        filled: true,
        fillColor: Color(0xFFF2F3F5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD4D5D7)),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2688EB)),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
    required this.passwordTextController,
  });

  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordTextController,
      obscureText: true,
      cursorColor: const Color(0xFF436BF1),
      decoration: const InputDecoration(
        labelText: 'Password',
        floatingLabelStyle: TextStyle(color: Color(0xFF2688EB)),
        // floatingLabelBehavior:FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        filled: true,
        fillColor: Color(0xFFF2F3F5),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD4D5D7)),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2688EB)),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
