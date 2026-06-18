import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat_mobile/widgets/custom_textfield.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(child: Image.asset('assets/icons/splash.png', width: 100)),
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
                  label: 'Email Address',
                  hintText: 'example@gmail.com',
                  prefixIcon: const Icon(Icons.email),
                ),
          
                const SizedBox(height: 15),
          
                CustomTextfield(
                  label: 'Password',
                  hintText: 'Enter password',
                  prefixIcon: const Icon(Icons.lock),
                ),
          
                const SizedBox(height: 25),
          
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Login"),
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
    );
  }
}
