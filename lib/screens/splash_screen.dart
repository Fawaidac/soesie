import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/wave_painters.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseScale;
  late Animation<double> _pulseOpacity;
  late Animation<double> _progressAnimation;
  Timer? _navigationTimer;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();

    // Pulse animation controller for background glow & logo effect
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _pulseScale = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _pulseOpacity = Tween<double>(begin: 0.35, end: 0.55).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Auto navigate after 3.5 seconds
    _navigationTimer = Timer(const Duration(milliseconds: 5000), () {
      _navigateToLogin();
    });
  }

  void _navigateToLogin() {
    if (_isNavigating || !mounted) return;
    _isNavigating = true;
    _navigationTimer?.cancel();
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: GestureDetector(
        onTap: _navigateToLogin,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: [
            // 1. Ambient Geometric Glow Backdrop
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.scale(
                        scale: _pulseScale.value,
                        child: Container(
                          width: 280,
                          height: 280,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryFixed.withValues(
                              alpha: _pulseOpacity.value * 0.4,
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -50),
                        child: Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryContainer.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // 2. Top Fluid Curve Header Accent (Clinical Wave Motif)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 190,
                width: size.width,
                child: CustomPaint(
                  painter: TopWavePainter(color: AppColors.primary),
                ),
              ),
            ),

            // 3. Bottom Fluid Curve Anchor Accent (Rotated 180 deg)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Transform.rotate(
                angle: math.pi,
                child: SizedBox(
                  height: 120,
                  width: size.width,
                  child: CustomPaint(
                    painter: BottomWavePainter(color: AppColors.primary),
                  ),
                ),
              ),
            ),

            // 4. Main Foreground Content (Header Bar + Center Brand + Footer)
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Center Content Cluster: Emblem + Logo + Subtitle
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Modern Healthcare Logo Container with logo_round.png
                        AnimatedBuilder(
                          animation: _pulseScale,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: 1.0 + (_pulseScale.value - 1.0) * 0.5,
                              child: child,
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Pulse ring behind logo
                              Container(
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.15,
                                    ),
                                    width: 1.5,
                                  ),
                                ),
                              ),

                              // Outer Glass Ring Frame with logo_round.png
                              Container(
                                width: 112,
                                height: 112,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColors.surfaceContainerLowest
                                      .withValues(alpha: 0.9),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.18,
                                      ),
                                      blurRadius: 36,
                                      offset: const Offset(0, 16),
                                      spreadRadius: -6,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'images/logo_round.png',
                                    width: 96,
                                    height: 96,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              // Miniature satellite badge top-right
                              Positioned(
                                top: 4,
                                right: 4,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.surfaceContainerLowest,
                                    border: Border.all(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.2,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.08,
                                        ),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.verified,
                                    size: 14,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Typography Brand Cluster
                        Text(
                          'SOESIE',
                          style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Presensi Elektronik Pegawai',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.local_hospital,
                              size: 16,
                              color: AppColors.tertiary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'RSD dr. Soebandi Jember',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Trust Indicator Micro-Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.surfaceContainerLowest.withValues(
                              alpha: 0.9,
                            ),
                            border: Border.all(
                              color: AppColors.outlineVariant.withValues(
                                alpha: 0.3,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.03),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedBuilder(
                                animation: _pulseOpacity,
                                builder: (context, child) {
                                  return Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.tertiaryContainer
                                          .withValues(
                                            alpha: _pulseOpacity.value * 1.5,
                                          ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Sistem Terenkripsi & Presisi GPS',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Loading Bar & Municipal Metadata
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0, top: 8.0),
                    child: Column(
                      children: [
                        // Progress Glide Bar
                        Container(
                          width: 144,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: AppColors.surfaceContainerHighest.withValues(
                              alpha: 0.6,
                            ),
                          ),
                          child: AnimatedBuilder(
                            animation: _progressAnimation,
                            builder: (context, child) {
                              return Align(
                                alignment: Alignment(
                                  (_progressAnimation.value * 2) - 1.0,
                                  0,
                                ),
                                child: FractionallySizedBox(
                                  widthFactor: 0.4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      gradient: const LinearGradient(
                                        colors: [
                                          AppColors.primary,
                                          AppColors.primaryContainer,
                                          AppColors.tertiaryFixedDim,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Version & Hospital Info Tag
                        Text(
                          'Versi 2.4.0 • Sistem Informasi Rumah Sakit Terintegrasi',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Municipal Accreditation Tag
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.account_balance,
                              size: 12,
                              color: AppColors.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'PEMERINTAH KABUPATEN JEMBER',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Mobile Bottom Safe Indicator Bar
                        Container(
                          width: 112,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: AppColors.onSurface.withValues(alpha: 0.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
