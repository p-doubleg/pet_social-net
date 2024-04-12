import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/auth/auth_screen_model.dart';
import 'package:vk/ui/widgets/custom/button_widgets.dart';
import 'package:vk/ui/widgets/custom/text_field_widgets.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthScreenModel>();
    final emailTextController = model.emailTextController;
    final passwordTextController = model.passwordTextController;
    bool buttonIsActive = model.buttonIsActive;
    String? errorText = model.errorText;
    onLogin() => model.login(context);
    onSignUp() => model.redirectOnSignUp(context);

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
              'Sign In to VK',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),
            EmailTextFieldWidget(emailTextController: emailTextController),
            const SizedBox(height: 6),
            PasswordTextFieldWidget(
                passwordTextController: passwordTextController),
            if (errorText != null) ...[
              const SizedBox(height: 12),
              Text(errorText, style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: 12),
            LogInButtonWidget(onTap: buttonIsActive ? () => onLogin() : null),
            const Spacer(),
            SignUpButtonWidget(onTap: onSignUp),
          ],
        ),
      ),
    );
  }
}
