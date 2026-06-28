import 'package:flutter/material.dart';

class AppColors {
  // ── Background hierarchy ──
  static const Color background = Color(0xFF050508);
  static const Color surface = Color(0xFF0E0E14);
  static const Color surfaceElevated = Color(0xFF16161F);
  static const Color surfaceGlass = Color(0x1AFFFFFF); // 10% white
  static const Color surfaceGlassHover = Color(0x26FFFFFF); // 15% white
  static const Color border = Color(0xFF1E1E2C);
  static const Color borderGlass = Color(0x33FFFFFF); // 20% white
  static const Color borderSubtle = Color(0x0DFFFFFF); // 5% white

  // ── Brand ──
  static const Color primary = Color(0xFFFF4D1A);
  static const Color primaryLight = Color(0xFFFF7043);
  static const Color primaryDim = Color(0x22FF4D1A);
  static const Color primaryGlow = Color(0x44FF4D1A);

  // ── Accent gradient endpoints ──
  static const Color gradientStart = Color(0xFFFF4D1A);
  static const Color gradientEnd = Color(0xFFFF8A50);

  // ── Semantic ──
  static const Color success = Color(0xFF00E676);
  static const Color successDim = Color(0x2200E676);
  static const Color warning = Color(0xFFFFD600);
  static const Color warningDim = Color(0x22FFD600);
  static const Color error = Color(0xFFFF1744);
  static const Color errorDim = Color(0x22FF1744);

  // ── Text ──
  static const Color textPrimary = Color(0xFFF0F0F5);
  static const Color textSecondary = Color(0xFF9090A8);
  static const Color textMuted = Color(0xFF555568);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ── Gradients ──
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [Color(0x1AFFFFFF), Color(0x0DFFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF12121A), Color(0xFF0A0A10)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
