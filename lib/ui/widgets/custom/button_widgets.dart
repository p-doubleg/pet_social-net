import 'package:flutter/material.dart';

class LogInButtonWidget extends StatelessWidget {
  const LogInButtonWidget({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 46,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF2D81E1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        child: const Text(
          'Log In',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF4BB43B),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
