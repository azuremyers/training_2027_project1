import 'dart:io';


void runCli(List<String> arguments) {
  print('Welcome to scouting!');

  while(true) {
    print('Press 1 to add a team');
    print('Press 2 to view a team\'s stats');
    print('Press 3 to scout a match');
    print('Press "q" to quit');

    String? variable = stdin.readLineSync();
    if (variable == '1') {
      addTeam();
    } else if (variable == '2') {
      viewTeamStat();
    } else if (variable == '3') {
      scoutMatch();
    } else if (variable == 'q') {
      break;
    } else {
      print('Not an option! Try again:');
    }
  }
}

void addTeam() {
  while(true) {
    stdout.write('Enter team number you are adding: ');
    try {
      int teamNum = int.parse(stdin.readLineSync()!);
      stdout.write('Enter team name for team $teamNum: ');
      String? name = stdin.readLineSync();
      stdout.write('Add $name, $teamNum to catalog? (y/n): ');
      String? add = stdin.readLineSync();
      if (add == 'y') {
        teams[teamNum] = Team(teamNumber: teamNum, teamName: name!, matches: []);
      }
      return;
    } catch (e) {
      print('Not valid Team Number! Try again:');
    }
  }
}

  Map<int, Team> teams = {

  };

void viewTeamStat() {
  while(true) {
    stdout.write('Enter team number you are viewing: ');
    try {
      int teamNum = int.parse(stdin.readLineSync()!);
      Team? team = teams[teamNum];
      if (team == null) {
        print('Team not found!');
      } else {
        print('Team number: ${team.teamNumber}');
        print('Team name: ${team.teamName}');
        print('Matches:');
        for (Match match in team.matches) {
          print('  Match number: ${match.matchNumber}');
          print('  Score: ${match.score}');
          print('  Win: ${match.win}');
          print('');
        }
      }
      return;
    } catch (e) {
      print('Not valid Team Number! Try again:');
    }
  }
}

void scoutMatch() {
  while(true) {
    stdout.write('Enter team number you are scouting: ');
    try {
      int teamNum = int.parse(stdin.readLineSync()!);
      Team? team = teams[teamNum];
      if (team == null) {
        print('Team not found!');
      } else {
        stdout.write('Enter match number: ');
        String? matchNum = stdin.readLineSync();
        stdout.write('Enter score for match $matchNum: ');
        String? scoreNum = stdin.readLineSync();
        stdout.write('Did $teamNum win match? (y/n) ');
        String? winNum = stdin.readLineSync();
        stdout.write('Add match $matchNum to catalog? (y/n): ');
        String? add = stdin.readLineSync();
        if (add == 'y') {
          team.matches.add(Match(matchNumber: matchNum!, score: scoreNum!, win: winNum!));
        }
      }
      return;
    } catch (e) {
      print('Not valid Team Number! Try again:');
    }
  }
}

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
