import 'dart:math';

import 'data/challenge_data.dart';
import 'data/user_data.dart';

void main() {
  // Simulate challenge for each user
  for (final user in usersData) {
    print("User ${user.fullname} created");

    // Check challenge eligibility and join
    if (user.joinChallenge(challengeData)) {
      print("${user.fullname} joined ${challengeData.title}");
      print("============================================================");

      // Simulate user progress for each day
      for (final challenge in challengeData.dailyChallenges) {
        print(
            "Day ${challenge.day} started with ${challenge.tasks.length} tasks to complete");
        for (final task in challenge.tasks) {
          // Use random tasks complete status on day 5 to create the possibility that the challenge not always completed
          task.completed = challenge.day < 5 ? true : Random().nextBool();
          print(
              "- Task ${challenge.tasks.indexOf(task) + 1}: ${task.desc} (completed? ${task.completed})");
        }

        // Check if all daily tasks is completed
        if (challenge.isCompletedDaily()) {
          user.awardPoints(challenge.points);
          print(
              "Challenge day ${challenge.day} completed, +${challenge.points} points");
          print("============================================================");
        } else {
          // Break out of the daily challenge loop if any task is incomplete
          print("============================================================");
          break;
        }
      }

      // Return challenge result
      if (user.isCompletedChallenge()) {
        print(
            "Congratulations! ${user.fullname} completed the ${challengeData.title} and earned ${user.points} points!");
      } else {
        List<String> uncompletedTasks = [];
        for (final dailyChallenge in challengeData.dailyChallenges) {
          // Filter task by uncomplete only
          for (final task in dailyChallenge.tasks.where((t) => !t.completed)) {
            // Create a formatted string combining day and task description
            uncompletedTasks.add("Day ${dailyChallenge.day}: ${task.desc}");
          }
        }
        print(
            "Your challenge broke at day ${user.dayStreak} and only earned ${user.points} points because these tasks are not complete: \n- ${uncompletedTasks.join('\n- ')}");
      }
      print("============================================================\n\n");
    } else {
      print("${user.fullname} falied to join ${challengeData.title}");
      print("============================================================");
    }
  }
}
