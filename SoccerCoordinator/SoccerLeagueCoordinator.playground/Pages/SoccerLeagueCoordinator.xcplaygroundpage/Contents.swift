// The collection of players is created
let players: [[String : Any]]

// The collection of players in Team Sharks
var teamSharks: [[String : Any]] = []

// The collection of players in Team Dragons
var teamDragons: [[String : Any]] = []

// The collection of players in Team Raptors
var teamRaptors: [[String : Any]] = []

// The number of teams (likely to never change)
let teamCount = [teamSharks, teamDragons, teamRaptors].count

// The collection of letters
var letters: [String] = []

// The players are now defined
players = [
    [
        "name": "Joe Smith",
        "height": 42,
        "isExperienced": true,
        "guardians": "Jim and Jan Smith"
    ],
    [
        "name": "Jill Tanner",
        "height": 36,
        "isExperienced": true,
        "guardians": "Clara Tanner"
    ],
    [
        "name": "Bill Bon",
        "height": 43,
        "isExperienced": true,
        "guardians": "Sara and Jenny Bon"
    ],
    [
        "name": "Eva Gordon",
        "height": 45,
        "isExperienced": false,
        "guardians": "Wendy and Mike Gordon"
    ],
    [
        "name": "Matt Gill",
        "height": 40,
        "isExperienced": false,
        "guardians": "Charles and Sylvia Gill"
    ],
    [
        "name": "Kimmy Stein",
        "height": 41,
        "isExperienced": false,
        "guardians": "Bill and Hillary Stein"
    ],
    [
        "name": "Sammy Adams",
        "height": 45,
        "isExperienced": false,
        "guardians": "Jeff Adams"
    ],
    [
        "name": "Karl Saygan",
        "height": 42,
        "isExperienced": true,
        "guardians": "Heather Bledsoe"
    ],
    [
        "name": "Suzane Greenberg",
        "height": 44,
        "isExperienced": true,
        "guardians": "Henrietta Dumas"
    ],
    [
        "name": "Sal Dali",
        "height": 41,
        "isExperienced": false,
        "guardians": "Gala Dali"
    ],
    [
        "name": "Joe Kavalier",
        "height": 39,
        "isExperienced": false,
        "guardians": "Sam and Elaine Kavalier"
    ],
    [
        "name": "Ben Finkelstein",
        "height": 44,
        "isExperienced": false,
        "guardians": "Aaron and Jill Finkelstein"
    ],
    [
        "name": "Diego Soto",
        "height": 41,
        "isExperienced": true,
        "guardians": "Robin and Sarika Soto"
    ],
    [
        "name": "Chloe Alaska",
        "height": 47,
        "isExperienced": false,
        "guardians": "David and Jamie Alaska"
    ],
    [
        "name": "Arnold Willis",
        "height": 43,
        "isExperienced": false,
        "guardians": "Claire Willis"
    ],
    [
        "name": "Phillip Helm",
        "height": 44,
        "isExperienced": true,
        "guardians": "Thomas Helm and Eva Jones"
    ],
    [
        "name": "Les Clay",
        "height": 42,
        "isExperienced": true,
        "guardians": "Wynonna Brown"
    ],
    [
        "name": "Herschel Krustofski",
        "height": 45,
        "isExperienced": true,
        "guardians": "Hyman and Rachel Krustofski"
    ]
]

/// Sorts a given collection of players
func sort(_ players: [[String : Any]]) {
    // If the players can be equally divided to each team,
    if players.count % teamCount == 0 {
        // ...sort the players
        
        // The collection of experienced players
        var experiencedPlayers: [[String : Any]] = []
        
        // The collection of inexperienced players
        var inexperiencedPlayers: [[String : Any]] = []
        
        // Loop through the players
        for player in players {
            // If the player is experienced,
            if player["isExperienced"] as! Bool {
                // ...add him/her to the collection of experienced players
                experiencedPlayers.append(player)
            } else {
                // ...add him/her tothe collection of inexperienced players
                inexperiencedPlayers.append(player)
            }
        }
        
        // Add experienced players to each team evenly ---------------------------->
        
        // Loop through the experienced players
        for i in 0..<experiencedPlayers.count {
            // Add players to each team
            if teamSharks.count < experiencedPlayers.count / teamCount {
                teamSharks.append(experiencedPlayers[i])
            } else if teamDragons.count < experiencedPlayers.count / teamCount {
                teamDragons.append(experiencedPlayers[i])
            } else {
                teamRaptors.append(experiencedPlayers[i])
            }
        }
        
        // Add inexperienced players to each team evenly -------------------------->
        
        // Loop through the inexperienced players
        for i in 0..<inexperiencedPlayers.count {
            // Add players to each team
            if teamSharks.count < players.count / teamCount {
                teamSharks.append(inexperiencedPlayers[i])
            } else if teamDragons.count < players.count / teamCount {
                teamDragons.append(inexperiencedPlayers[i])
            } else {
                teamRaptors.append(inexperiencedPlayers[i])
            }
        }
    } else {
        // ...print an error message to the console
        print("ERROR: Not possible to send equal number of players to each team")
    }
}

/// Returns the average height of a team
func averageHeight(of team: [[String : Any]]) -> Int {
    var totalHeight: Float = 0
    
    for player in team {
        totalHeight += Float(player["height"] as! Int)
    }
    
    return Int((totalHeight / Float(team.count)).rounded(FloatingPointRoundingRule.toNearestOrAwayFromZero))
}

/// Appends letters to the main collection
func appendLetters(from team: [[String : Any]], name: String, timings: String) {
    var teamLetters: [String] = []
    
    for player in team {
        let letter =
            "\nDear \(player["guardians"] as! String),\nYour" +
                " child \(player["name"] as! String) has been " +
                "invited to practice with Team \(name) on \(timings)." +
        "\n\nThanks!"
        
        teamLetters.append(letter)
    }
    
    letters.append(contentsOf: teamLetters)
}

// The players are sorted into each team
sort(players)

// The average height of each team is printed to the console
print("Team Sharks has an average height of \(averageHeight(of: teamSharks)) inches.")
print("Team Dragons has an average height of \(averageHeight(of: teamDragons)) inches.")
print("Team Raptors has an average height of \(averageHeight(of: teamRaptors)) inches.")

// Appends the letters to the main collection
appendLetters(from: teamSharks, name: "Sharks", timings: "March 17th, 1:00 PM")
appendLetters(from: teamDragons, name: "Dragons", timings: "March 17th, 3:00 PM")
appendLetters(from: teamRaptors, name: "Raptors", timings: "March 18th, 1:00 PM")

// Print the letters
for letter in letters {
    print(letter)
}
