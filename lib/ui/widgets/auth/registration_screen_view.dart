import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/auth/registration_screen_model.dart';

class RegistrationScreenWidget extends StatelessWidget {
  const RegistrationScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistrationScreenModel>();
    final emailTextController = model.emailTextController;
    final passwordTextController = model.passwordTextController;
    onSingUp() => model.register(context);
    onLogIn() => model.redirectOnLogIn(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          children: [
            SvgPicture.asset(
              'images/vk_logo.svg',
              width: 70,
            ),
            const SizedBox(height: 16),
            const Text(
              'Sign Up to VK',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
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
            ),
            const SizedBox(height: 6),
            TextField(
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
            ),
            // if (errorText != null) ...[
            //   const SizedBox(height: 16),
            //   Text(errorText!),
            // ],
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onSingUp,
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
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              // height: 46,
              child: TextButton(
                onPressed: onLogIn,
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
            ),
          ],
        ),
      ),
    );
  }
}
