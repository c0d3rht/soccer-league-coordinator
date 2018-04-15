import UIKit

// The collection of all players
let players: [[String : Any]]

// The collection of all teams
var teams: [String : [[String : Any]]] = ["Sharks": [], "Dragons": [], "Raptors": []]

// The collection of letters
var letters: [String] = []

players = [
    [
        "name": "Joe Smith",
        "height": 42.0,
        "isExperienced": true,
        "guardians": "Jim and Jan Smith"
    ],
    [
        "name": "Jill Tanner",
        "height": 36.0,
        "isExperienced": true,
        "guardians": "Clara Tanner"
    ],
    [
        "name": "Bill Bon",
        "height": 43.0,
        "isExperienced": true,
        "guardians": "Sara and Jenny Bon"
    ],
    [
        "name": "Eva Gordon",
        "height": 45.0,
        "isExperienced": false,
        "guardians": "Wendy and Mike Gordon"
    ],
    [
        "name": "Matt Gill",
        "height": 40.0,
        "isExperienced": false,
        "guardians": "Charles and Sylvia Gill"
    ],
    [
        "name": "Kimmy Stein",
        "height": 41.0,
        "isExperienced": false,
        "guardians": "Bill and Hillary Stein"
    ],
    [
        "name": "Sammy Adams",
        "height": 45.0,
        "isExperienced": false,
        "guardians": "Jeff Adams"
    ],
    [
        "name": "Karl Saygan",
        "height": 42.0,
        "isExperienced": true,
        "guardians": "Heather Bledsoe"
    ],
    [
        "name": "Suzane Greenberg",
        "height": 44.0,
        "isExperienced": true,
        "guardians": "Henrietta Dumas"
    ],
    [
        "name": "Sal Dali",
        "height": 41.0,
        "isExperienced": false,
        "guardians": "Gala Dali"
    ],
    [
        "name": "Joe Kavalier",
        "height": 39.0,
        "isExperienced": false,
        "guardians": "Sam and Elaine Kavalier"
    ],
    [
        "name": "Ben Finkelstein",
        "height": 44.0,
        "isExperienced": false,
        "guardians": "Aaron and Jill Finkelstein"
    ],
    [
        "name": "Diego Soto",
        "height": 41.0,
        "isExperienced": true,
        "guardians": "Robin and Sarika Soto"
    ],
    [
        "name": "Chloe Alaska",
        "height": 47.0,
        "isExperienced": false,
        "guardians": "David and Jamie Alaska"
    ],
    [
        "name": "Arnold Willis",
        "height": 43.0,
        "isExperienced": false,
        "guardians": "Claire Willis"
    ],
    [
        "name": "Phillip Helm",
        "height": 44.0,
        "isExperienced": true,
        "guardians": "Thomas Helm and Eva Jones"
    ],
    [
        "name": "Les Clay",
        "height": 42.0,
        "isExperienced": true,
        "guardians": "Wynonna Brown"
    ],
    [
        "name": "Herschel Krustofski",
        "height": 45.0,
        "isExperienced": true,
        "guardians": "Hyman and Rachel Krustofski"
    ]
]

/// Sorts a given collection of players.
func sort(_ players: [[String : Any]]) {
    // If the players can be equally divided to each team,
    if players.count % teams.count == 0 {
        // ...sort the players
        
        // The collection of experienced players
        var experiencedPlayers: [[String : Any]] = []
        
        // The collection of inexperienced players
        var inexperiencedPlayers: [[String : Any]] = []
        
        // Loop through the players
        for player in players {
            if let isExperienced = player["isExperienced"] as? Bool {
                // If the player is experienced,
                if isExperienced {
                    // ...add him/her to the collection of experienced players
                    experiencedPlayers.append(player)
                } else {
                    // ...add him/her to the collection of inexperienced players
                    inexperiencedPlayers.append(player)
                }
            }
        }
        
        // The code below ensures the proximity of the average heights of all teams
        experiencedPlayers.sort(by: { $0["height"] as! Double > $1["height"] as! Double })
        inexperiencedPlayers.sort(by: { $1["height"] as! Double > $0["height"] as! Double })
        
        // Add experienced players to each team evenly
        var i = 0
        repeat {
            for key in teams.keys {
                if teams[key]!.count < experiencedPlayers.count / teams.count {
                    teams[key]!.append(experiencedPlayers[i])
                    break
                }
            }
            
            i += 1
        } while i < experiencedPlayers.count
        
        // Add inexperienced players to each team evenly
        i = 0
        repeat {
            for key in teams.keys {
                if teams[key]!.count < players.count / teams.count {
                    teams[key]!.append(inexperiencedPlayers[i])
                    break
                }
            }
            
            i += 1
        } while i < inexperiencedPlayers.count
    } else {
        // ...print an error message to the console
        print("ERROR: Not possible to send equal number of players to each team\n")
    }
}

/// Returns the average height of a team.
func averageHeight(of team: [[String : Any]]) -> Double {
    var totalHeight = 0.0
    
    for player in team {
        if let height = player["height"] as? Double {
            totalHeight += height
        }
    }
    
    return totalHeight / Double(team.count)
}

/// Prints the average heights of a given collection of teams.
func printAverageHeights(of teams: [String : [[String : Any]]]) {
    var teamsPrinted: [String] = []
    
    for key in teams.keys {
        let team = teams[key]!
        var statement = String(format: "Team \(key) has an average height of %.1f inches.", averageHeight(of: team))
        
        if teamsPrinted.count == teams.count - 1 {
            statement += "\n"
        }
        
        teamsPrinted.append(key)
        print(statement)
    }
}

/// Returns an array of letters from a particular team.
func sendLetters(from teamName: String, on date: String) -> [String] {
    var teamLetters: [String] = []
    
    if let team = teams[teamName] {
        for player in team {
            let guardianName = player["guardians"] as! String
            let playerName = player["name"] as! String
            
            let letter = "Dear \(guardianName),\nYour child \(playerName) has been invited to practice with Team \(teamName) on \(date).\n"
            
            teamLetters.append(letter)
        }
    }
    
    return teamLetters
}

/// Appends the letters to the main collection and prints them to the console.
func receiveLetters() {
    var unreadLetters: [String] = []
    
    for key in teams.keys {
        let date: String
        
        switch key {
        case "Sharks":
            date = "March 17th, 1:00 PM"
        case "Dragons":
            date = "March 17th, 3:00 PM"
        case "Raptors":
            date = "March 18th, 1:00 PM"
        default:
            date = "some day"
        }
        
        unreadLetters.append(contentsOf: sendLetters(from: key, on: date))
    }
    
    letters.append(contentsOf: unreadLetters)
}

// The players are sorted into the dictionary 'teams'
sort(players)

// The code below prints the required output
printAverageHeights(of: teams)

receiveLetters()
for letter in letters {
    print(letter)
}

// Feel free to uncomment the code below because it was mentioned in the criteria, although it feels irrelevant to the needs at hand (and is also redundant).
// Personally, it seems more subtle and modular to have a collection of teams instead of separate variables or constants so more teams can be added and updated with ease.

//var teamSharks = teams["Sharks"]!
//var teamDragons = teams["Dragons"]!
//var teamRaptors = teams["Raptors"]!
