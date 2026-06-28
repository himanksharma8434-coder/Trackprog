import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  // ── Heading shortcuts (used throughout screens) ──
  static TextStyle get h1 => GoogleFonts.inter(
    fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1.0, color: AppColors.textPrimary,
  );
  static TextStyle get h2 => GoogleFonts.inter(
    fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -0.5, color: AppColors.textPrimary,
  );
  static TextStyle get h3 => GoogleFonts.inter(
    fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );
  static TextStyle get h4 => GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );

  // ── Body shortcuts ──
  static TextStyle get bodyL => GoogleFonts.inter(
    fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textPrimary,
  );
  static TextStyle get bodyM => GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textPrimary,
  );
  static TextStyle get bodyS => GoogleFonts.inter(
    fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
  );

  // ── Label shortcuts ──
  static TextStyle get labelL => GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: AppColors.textPrimary,
  );
  static TextStyle get labelS => GoogleFonts.inter(
    fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.2, color: AppColors.textSecondary,
  );

  // ── Monospace numeric data ──
  static TextStyle get numericData => GoogleFonts.jetBrainsMono(
    fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );
  static TextStyle get numericDataLarge => GoogleFonts.jetBrainsMono(
    fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );

  // ── Full TextTheme for ThemeData ──
  static final TextTheme textTheme = TextTheme(
    displayLarge: h1,
    displayMedium: h2,
    displaySmall: h3,
    headlineMedium: h4,
    titleLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
    titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
    bodyLarge: bodyL,
    bodyMedium: bodyM,
    bodySmall: bodyS,
    labelLarge: labelL,
    labelSmall: labelS,
  );
}
