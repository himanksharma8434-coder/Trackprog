class StrengthTracking {
  /// Estimates 1-Rep Max using the Epley formula
  /// e1RM = weight * (1 + reps / 30)
  /// Where reps = logged reps + logged RIR (effective failure reps)
  static double epley1RM(double weight, int effectiveReps) {
    return weight * (1 + effectiveReps / 30.0);
  }

  /// RIR adjustment: add RIR to logged reps before plugging into formula
  static double e1RMFromSubMaxSet(
    double weight,
    int reps,
    int rir,
  ) {
    return epley1RM(weight, reps + rir);
  }
}
