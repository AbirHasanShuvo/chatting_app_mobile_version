import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat_mobile/features/authentication/presentation/providers/image_provider.dart';
import 'package:snapchat_mobile/widgets/custom_textfield.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imageProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Text('Create Account', style: GoogleFonts.poppins(fontSize: 28)),

              const SizedBox(height: 20),

              // PROFILE IMAGE
              GestureDetector(
                onTap: () {
                  ref.read(imageProvider.notifier).pickImage();
                },
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: image != null ? FileImage(image) : null,
                  child: image == null
                      ? Icon(Icons.camera_alt, size: 30)
                      : null,
                ),
              ),

              const SizedBox(height: 25),

              CustomTextfield(
                label: 'Full Name',
                hintText: 'Enter your name',
                prefixIcon: const Icon(Icons.person),
              ),

              const SizedBox(height: 15),

              CustomTextfield(
                label: 'Phone Number',
                hintText: '+8801XXXXXXXXX',
                prefixIcon: const Icon(Icons.phone),
              ),

              const SizedBox(height: 15),

              CustomTextfield(
                label: 'Email Address',
                hintText: 'example@gmail.com',
                prefixIcon: const Icon(Icons.email),
              ),

              const SizedBox(height: 15),

              CustomTextfield(
                label: 'Date of Birth',
                hintText: 'YYYY-MM-DD',
                prefixIcon: const Icon(Icons.calendar_today),
              ),
              const SizedBox(height: 15),

              CustomTextfield(
                label: 'Password',
                hintText: 'Enter Your Password',
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
              ),
              const SizedBox(height: 15),

              CustomTextfield(
                label: 'Confirm Password',
                hintText: 'Re-enter Your Password',
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
