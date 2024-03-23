import '../models/challenge_model.dart';

final challengeData = Challenge(
  id: 1,
  title: "5-Day Fitness Challenge",
  desc: "Stay active and healthy for 5 days!",
  requirement: Requirement(
    minimumAge: 20,
    gender: ['male', 'female'],
  ),
  dailyChallenges: <DailyChallenge>[
    DailyChallenge(
      day: 1,
      points: 100,
      tasks: [
        Checkpoint(id: 1, desc: "Run 1 kilometer"),
        Checkpoint(id: 2, desc: "Do 10 squats"),
        Checkpoint(id: 3, desc: "Eat a healthy breakfast"),
      ],
    ),
    DailyChallenge(
      day: 2,
      points: 150,
      tasks: [
        Checkpoint(id: 1, desc: "Go for a 30-minute walk"),
        Checkpoint(id: 2, desc: "Do 3 sets of 10 push-ups"),
        Checkpoint(id: 3, desc: "Drink 8 glasses of water"),
      ],
    ),
    DailyChallenge(
      day: 3,
      points: 200,
      tasks: [
        Checkpoint(id: 1, desc: "Bike for 20 minutes"),
        Checkpoint(id: 2, desc: "Do 15 lunges per leg"),
        Checkpoint(id: 3, desc: "Meditate for 10 minutes"),
      ],
    ),
    DailyChallenge(
      day: 4,
      points: 250,
      tasks: [
        Checkpoint(id: 1, desc: "Swim for 15 minutes"),
        Checkpoint(id: 2, desc: "Do 3 sets of 12 bicep curls"),
        Checkpoint(id: 3, desc: "Eat a salad for lunch"),
      ],
    ),
    DailyChallenge(
      day: 5,
      points: 300,
      tasks: [
        Checkpoint(id: 1, desc: "Do yoga for 30 minutes"),
        Checkpoint(id: 2, desc: "Do 20 jumping jacks"),
        Checkpoint(id: 3, desc: "Eat a healthy dinner"),
      ],
    ),
  ],
);
