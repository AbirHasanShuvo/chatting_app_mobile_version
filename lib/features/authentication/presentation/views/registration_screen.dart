import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat_mobile/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:snapchat_mobile/features/authentication/providers/image_provider.dart';
import 'package:snapchat_mobile/widgets/custom_textfield.dart';
import 'package:snapchat_mobile/widgets/shared/utils/validators.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final dateofbirthController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    dateofbirthController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(imageProvider);
    final authState = ref.watch(authControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                Text(
                  'Create Account',
                  style: GoogleFonts.poppins(fontSize: 28),
                ),

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    ref.read(imageProvider.notifier).pickImage();
                  },
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: image != null ? FileImage(image) : null,
                    child: image == null
                        ? const Icon(Icons.camera_alt, size: 30)
                        : null,
                  ),
                ),

                const SizedBox(height: 25),

                CustomTextfield(
                  label: 'Full Name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                  controller: nameController,
                  validator: Validators.requiredField,
                ),

                const SizedBox(height: 15),

                CustomTextfield(
                  label: 'Phone Number',
                  hintText: '+8801XXXXXXXXX',
                  prefixIcon: Icon(Icons.phone),
                  controller: phoneController,
                  validator: Validators.requiredField,
                ),

                const SizedBox(height: 15),

                CustomTextfield(
                  controller: emailController,
                  label: 'Email Address',
                  hintText: 'example@gmail.com',
                  prefixIcon: const Icon(Icons.email),
                  validator: Validators.email,
                ),

                const SizedBox(height: 15),

                CustomTextfield(
                  label: 'Date of Birth',
                  hintText: 'YYYY-MM-DD',
                  prefixIcon: Icon(Icons.calendar_today),
                  controller: dateofbirthController,
                  validator: Validators.requiredField,
                ),
                const SizedBox(height: 15),

                CustomTextfield(
                  label: 'Password',
                  hintText: 'Enter Your Password',
                  prefixIcon: Icon(Icons.lock),
                  isPassword: true,
                  controller: passwordController,
                  validator: Validators.password,
                ),
                const SizedBox(height: 15),

                CustomTextfield(
                  label: 'Confirm Password',
                  hintText: 'Re-enter Your Password',
                  prefixIcon: Icon(Icons.lock),
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (value) => Validators.confirmPassword(
                    value,
                    passwordController.text,
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!(_formKey.currentState?.validate() ?? false)) {
                        return;
                      }
                      if (image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a profile image'),
                          ),
                        );
                        return;
                      }

                      final success = await ref
                          .read(authControllerProvider.notifier)
                          .register(
                            name: nameController.text.trim(),
                            date_of_birth: dateofbirthController.text.trim(),
                            email: emailController.text.trim(),
                            phone: phoneController.text.trim(),
                            password: passwordController.text.trim(),
                            profilePicturePath: image.path,
                          );

                      if (success && context.mounted) {
                        context.go('/home');
                      }
                    },
                    child: authState.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text("Register"),
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
      ),
    );
  }
}
