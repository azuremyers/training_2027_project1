class Team {
  int teamNumber;
  String teamName;
  List<Match> matches;

  Team({
    required this.teamNumber,
    required this.teamName,
    required this.matches,
  });
}

class Match {
  String matchNumber;
  String score;
  String win;

  Match({
    required this.matchNumber,
    required this.score,
    required this.win,
  });
}
