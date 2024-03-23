import 'challenge_model.dart';

class UserModel {
  final int id;
  final String fullname;
  final String gender; //(e.g., 'male', 'female')
  final int age;

  /// Total points earned from challenges.
  int points;

  /// Number of consecutive days the user completed daily tasks in a challenge.
  int dayStreak;

  /// The current challenge the user is participating in, or null if not joined.
  Challenge? currentChallenge;

  UserModel({
    required this.id,
    required this.fullname,
    required this.gender,
    required this.age,
    this.points = 0,
    this.dayStreak = 0,
  });

  /// Attempts to join a challenge.
  ///
  /// Returns true if the user meets the challenge requirements and successfully joins,
  /// false otherwise. Prints a message explaining why the user cannot join
  /// (e.g., age or gender restrictions, already joined another challenge).
  bool joinChallenge(Challenge challenge) {
    if (currentChallenge == null &&
        age >= challenge.requirement.minimumAge &&
        challenge.requirement.gender.contains(gender)) {
      currentChallenge = challenge;
      return true;
    } else {
      if (!challenge.requirement.gender.contains(gender)) {
        print("$fullname gender does not match challenge gender requirements");
      } else if (age < challenge.requirement.minimumAge) {
        print("$fullname age does not meet challenge age requirements");
      } else {
        print(
            "$fullname already joined a challenge. Please complete joined challenge before join new one.");
      }
      return false;
    }
  }

  /// Awards points to the user and increments the day streak.
  ///
  /// This method should be called when the user completes a daily task in a challenge.
  void awardPoints(int points) {
    this.points += points;
    dayStreak += 1;
  }

  /// Checks if the user has completed the current challenge.
  ///
  /// Returns true if the user's day streak matches the number of daily challenges
  /// in the current challenge, false otherwise.
  bool isCompletedChallenge() {
    return dayStreak == currentChallenge?.dailyChallenges.length;
  }
}
