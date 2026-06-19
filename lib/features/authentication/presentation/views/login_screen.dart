import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat_mobile/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:snapchat_mobile/widgets/custom_textfield.dart';
import 'package:snapchat_mobile/widgets/shared/utils/validators.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    ref.listen(authControllerProvider, (prev, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          final message = error.toString().replaceAll('Exception: ', '');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: Colors.red),
          );
        },
      );
    });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset('assets/icons/splash.png', width: 100),
                  ),
                  const SizedBox(height: 15),
                  Text('Sign In', style: GoogleFonts.poppins(fontSize: 30)),
                  const SizedBox(height: 10),
                  Text(
                    'Enter your email and password to login',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 25),

                  CustomTextfield(
                    controller: emailController,
                    label: 'Email Address',
                    hintText: 'example@gmail.com',
                    prefixIcon: const Icon(Icons.email),
                    validator: Validators.email,
                  ),

                  const SizedBox(height: 15),

                  CustomTextfield(
                    label: 'Password',
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.lock),
                    controller: passwordController,
                    validator: Validators.password,
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: authState.isLoading
                          ? null
                          : () async {
                              if (!(_formKey.currentState?.validate() ??
                                  false)) {
                                return;
                              }

                              final success = await ref
                                  .read(authControllerProvider.notifier)
                                  .login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );

                              if (success && context.mounted) {
                                context.pushReplacement('/home');
                              }
                            },
                      child: authState.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text("Login"),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () {
                      context.push('/registration');
                    },
                    child: const Text("Create an account"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
