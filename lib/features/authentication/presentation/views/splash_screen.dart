import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      context.pushReplacement('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('SnapChat', style: GoogleFonts.blackOpsOne(fontSize: 45)),
            const SizedBox(height: 15),
            Image.asset(height: 250, width: 250, 'assets/icons/splash.png'),
            const SizedBox(height: 20),
            Text('Loading....', style: GoogleFonts.blackOpsOne(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
