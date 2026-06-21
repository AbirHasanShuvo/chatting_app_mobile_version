import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat_mobile/features/authentication/providers/auth_provider.dart';
import 'package:snapchat_mobile/features/home/providers/home_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 1));

    final storage = ref.read(secureStorageProvider);
    final token = await storage.getToken();
    
    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      await ref.read(fetchSavedUserProvider.future);
      await ref.read(alluserProvider.future);
      context.go('/home');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SnapChat', style: GoogleFonts.blackOpsOne(fontSize: 45)),
            const SizedBox(height: 15),
            Image.asset('assets/icons/splash.png', height: 250, width: 250),
            const SizedBox(height: 20),
            Text('Loading....', style: GoogleFonts.blackOpsOne(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
