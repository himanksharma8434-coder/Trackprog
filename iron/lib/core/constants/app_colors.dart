import 'package:flutter/material.dart';

class AppColors {
  // ── Background hierarchy ──
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF121212);
  static const Color surfaceElevated = Color(0xFF1E1E1E);
  static const Color surfaceGlass = Color(0x1AFFFFFF); // 10% white for minimal glass
  static const Color surfaceGlassHover = Color(0x26FFFFFF);
  
  static const Color border = Color(0xFF262626);
  static const Color borderActive = Color(0xFF333333);
  static const Color borderSubtle = Color(0xFF1A1A1A);

  // ── Brand ──
  static const Color primary = Color(0xFF00A396);
  static const Color primaryLight = Color(0xFF5DDACB);
  static const Color primaryDim = Color(0x2200A396);
  static const Color primaryGlow = Color(0x4400A396); // Though we avoid glows mostly

  // ── Semantic ──
  static const Color success = Color(0xFF00A396); // Reuse primary for success in this aesthetic
  static const Color successDim = Color(0x2200A396);
  static const Color warning = Color(0xFF7A2F12); // Desaturated dark orange/red as per spec
  static const Color warningDim = Color(0x227A2F12);
  static const Color error = Color(0xFF690005); // Dark red
  static const Color errorDim = Color(0x22690005);

  // ── Text ──
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA3A3A3);
  static const Color textMuted = Color(0xFF737373);
  static const Color textOnPrimary = Color(0xFF000000); // Black on teal
}
