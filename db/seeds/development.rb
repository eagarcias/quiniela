# Teams creations

team1 = Team.create(name: "Qatar" )
team2 =Team.create(name: "Ecuador")
team3 =Team.create(name: "Senegal")
team4 =Team.create(name: "Holanda")
team5 =Team.create(name: "Inglaterra")
team6 =Team.create(name: "Iran")
team7 =Team.create(name: "USA")
team8 =Team.create(name: "Argentina")
team9 =Team.create(name: "Mexico")
team10 =Team.create(name: "Polonia")
team11 =Team.create(name: "Francia")
team12 =Team.create(name: "Brasil")

#Match creations
Match.create(first_team: team1, second_team: team2, date: DateTime.now)
Match.create(first_team: team3, second_team: team4, date: DateTime.now)
Match.create(first_team: team5, second_team: team6, date: DateTime.now, first_team_goals: 2, second_team_goals: 3)
Match.create(first_team: team7, second_team: team8, date: DateTime.now, first_team_goals: 4, second_team_goals: 1)
Match.create(first_team: team9, second_team: team10, date: DateTime.now, first_team_goals: 2, second_team_goals: 2)
Match.create(first_team: team11, second_team: team12, date: DateTime.now, first_team_goals: 0, second_team_goals: 4)
Match.create(first_team: team12, second_team: team4, date: DateTime.now, first_team_goals: 3, second_team_goals: 1)

