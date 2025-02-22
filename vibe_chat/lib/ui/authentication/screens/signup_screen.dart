import 'package:flutter/material.dart';
import 'package:vibe_chat/ui/authentication/widgets/auth_button.dart';
import 'package:vibe_chat/ui/authentication/widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void handleSignUp() {}

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.primary.withValues(alpha: 0.75),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "VibeChat",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w600
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                width: screenHeight * 0.25,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      children: [
                        AuthTextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          fieldType: 'email',
                          label: 'Email',
                          icon: Icons.email_rounded,
                        ),
                        const SizedBox(height: 16),
                        AuthTextField(
                          controller: userNameController,
                          keyboardType: TextInputType.text,
                          fieldType: 'username',
                          label: 'Username',
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 16),
                        AuthTextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          fieldType: 'password',
                          label: 'Password',
                          icon: Icons.lock_rounded,
                        ),
                        const SizedBox(height: 16),
                        AuthTextField(
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          fieldType: 'password',
                          label: 'Confirm Password',
                          icon: Icons.lock_rounded,
                        ),
                        const SizedBox(height: 24),
                        AuthButton(
                          onTapped: handleSignUp,
                          text: "Sign Up",
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
