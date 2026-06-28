enum AdjustmentMode {
  weightFirst,
  repsFirst,
}

enum ProgressionAction {
  increaseWeight,
  increaseReps,
  hold,
  reduceLoad,
}

class GymProfile {
  final double barWeight;
  final List<double> plateDenominations;

  const GymProfile({
    required this.barWeight,
    required this.plateDenominations,
  });

  /// Snaps a theoretical weight to the nearest loadable weight.
  double snapToIncrement(double theoreticalWeight) {
    if (plateDenominations.isEmpty) return barWeight;
    
    // Assumes plates are sorted or we find the minimum plate
    double minPlate = plateDenominations.reduce((a, b) => a < b ? a : b);
    double minIncrement = minPlate * 2;
    
    double weightWithoutBar = theoreticalWeight - barWeight;
    if (weightWithoutBar <= 0) return barWeight;

    // Round to nearest multiple of minIncrement
    double roundedWeightWithoutBar = (weightWithoutBar / minIncrement).round() * minIncrement;
    return barWeight + roundedWeightWithoutBar;
  }
}

class Target {
  final int minReps;
  final int maxReps;
  final int rirTarget;

  const Target({
    required this.minReps,
    required this.maxReps,
    required this.rirTarget,
  });

  int get middleReps => ((minReps + maxReps) / 2).round();
  int get expectedFailureReps => middleReps + rirTarget;
}

class SetResult {
  final double weight;
  final int reps;
  final int rir;

  const SetResult({
    required this.weight,
    required this.reps,
    required this.rir,
  });

  int get effectiveFailureReps => reps + rir;
}

class ProgressionResult {
  final ProgressionAction action;
  final double nextWeight;
  final int nextReps;
  final bool isSuboptimal;

  const ProgressionResult({
    required this.action,
    required this.nextWeight,
    required this.nextReps,
    this.isSuboptimal = false,
  });
}

class ProgressionEngine {
  /// Computes the next target weight and reps based on the performance.
  static ProgressionResult computeNextSession({
    required Target target,
    required SetResult currentPerformance,
    SetResult? previousPerformance,
    required GymProfile gymProfile,
    required AdjustmentMode mode,
  }) {
    bool triggerProgression = false;
    bool triggerReduction = false;

    // 5. Handle failure sets (0 RIR targets) separately
    if (target.rirTarget == 0) {
      if (previousPerformance != null &&
          currentPerformance.weight == previousPerformance.weight) {
        if (currentPerformance.reps > previousPerformance.reps) {
          triggerProgression = true;
        } else if (currentPerformance.reps < previousPerformance.reps) {
          triggerReduction = true;
        }
      } else {
        // If no previous performance, or different weight, fallback to effective reps comparison
        if (currentPerformance.effectiveFailureReps > target.expectedFailureReps) {
          triggerProgression = true;
        } else if (currentPerformance.effectiveFailureReps < target.expectedFailureReps) {
          triggerReduction = true;
        }
      }
    } else {
      // 1 & 2. Compute expected max performance and compare
      if (currentPerformance.effectiveFailureReps > target.expectedFailureReps) {
        triggerProgression = true;
      } else if (currentPerformance.effectiveFailureReps < target.expectedFailureReps) {
        triggerReduction = true;
      }
    }

    if (!triggerProgression && !triggerReduction) {
      return ProgressionResult(
        action: ProgressionAction.hold,
        nextWeight: currentPerformance.weight,
        nextReps: target.middleReps,
      );
    }

    if (triggerReduction) {
      return _reduceLoad(currentPerformance, target, gymProfile);
    }

    // 3. Choose progression path: weight-first or reps-first
    return _progressLoad(currentPerformance, target, gymProfile, mode);
  }

  static ProgressionResult _progressLoad(
    SetResult current,
    Target target,
    GymProfile gymProfile,
    AdjustmentMode mode,
  ) {
    if (mode == AdjustmentMode.weightFirst) {
      double snappedWeight = _getNextWeightUp(current.weight, gymProfile);
      
      if (snappedWeight > current.weight) {
         return ProgressionResult(
           action: ProgressionAction.increaseWeight,
           nextWeight: snappedWeight,
           nextReps: target.minReps,
         );
      } else {
        // Fallback to reps
        return ProgressionResult(
           action: ProgressionAction.increaseReps,
           nextWeight: current.weight,
           nextReps: current.reps + 1,
           isSuboptimal: true, // Flagged because weight couldn't be adjusted
         );
      }
    } else {
      // Reps first
      if (current.reps < target.maxReps) {
        return ProgressionResult(
           action: ProgressionAction.increaseReps,
           nextWeight: current.weight,
           nextReps: current.reps + 1,
        );
      } else {
        // Max reps reached, fallback to weight increase
        double snappedWeight = _getNextWeightUp(current.weight, gymProfile);

        if (snappedWeight > current.weight) {
          return ProgressionResult(
            action: ProgressionAction.increaseWeight,
            nextWeight: snappedWeight,
            nextReps: target.minReps,
          );
        } else {
          return ProgressionResult(
             action: ProgressionAction.hold,
             nextWeight: current.weight,
             nextReps: current.reps,
             isSuboptimal: true,
           );
        }
      }
    }
  }

  static ProgressionResult _reduceLoad(
    SetResult current,
    Target target,
    GymProfile gymProfile,
  ) {
    double snappedWeight = _getNextWeightDown(current.weight, gymProfile);

    return ProgressionResult(
      action: ProgressionAction.reduceLoad,
      nextWeight: snappedWeight,
      nextReps: target.maxReps,
    );
  }

  static double _getNextWeightUp(double currentWeight, GymProfile gymProfile) {
    if (gymProfile.plateDenominations.isEmpty) return currentWeight;
    double minPlate = gymProfile.plateDenominations.reduce((a, b) => a < b ? a : b);
    double minIncrement = minPlate * 2;
    double theoreticalWeight = currentWeight + minIncrement;
    return gymProfile.snapToIncrement(theoreticalWeight);
  }

  static double _getNextWeightDown(double currentWeight, GymProfile gymProfile) {
    if (gymProfile.plateDenominations.isEmpty) return gymProfile.barWeight;
    double minPlate = gymProfile.plateDenominations.reduce((a, b) => a < b ? a : b);
    double minIncrement = minPlate * 2;
    double theoreticalWeight = currentWeight - minIncrement;
    double snappedWeight = gymProfile.snapToIncrement(theoreticalWeight);
    return snappedWeight < gymProfile.barWeight ? gymProfile.barWeight : snappedWeight;
  }
}
