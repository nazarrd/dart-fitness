class Challenge {
  final int id;
  final String title;
  final String desc;
  final Requirement requirement;
  final List<DailyChallenge> dailyChallenges;

  Challenge({
    required this.id,
    required this.title,
    required this.desc,
    required this.requirement,
    required this.dailyChallenges,
  });
}

class Requirement {
  final int minimumAge;
  final List<String> gender;

  Requirement({required this.minimumAge, required this.gender});
}

class DailyChallenge {
  final int day;
  final int points;
  final List<Checkpoint> tasks;

  DailyChallenge({
    required this.day,
    required this.points,
    required this.tasks,
  });

  /// Checks if all tasks within the daily challenge are completed.
  bool isCompletedDaily() {
    return tasks.every((task) => task.completed);
  }
}

class Checkpoint {
  final int id;
  final String desc;
  bool completed;

  Checkpoint({
    required this.id,
    required this.desc,
    this.completed = false,
  });
}
