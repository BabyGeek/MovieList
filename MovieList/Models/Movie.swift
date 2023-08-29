//
//  Movie.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import Foundation

struct Movie {
    let image: String
    let title: String
    let description: String
    let rating: Double
    let durationInSecondes: Int
    let genres: [String]
    let releaseDate: Date
    let trailerLink: String
    var inWatchlist: Bool = false
    
    var durationHuman: String {
        let (hours, minutes) = (durationInSecondes / 3600, (durationInSecondes % 3600) / 60)
        
        return "\(hours)h \(minutes)min"
    }
    
    var releaseYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: releaseDate)
    }
    
    var releaseDateHuman: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy, d MMMM"
        return dateFormatter.string(from: releaseDate)
    }
}

extension Movie: Hashable { }
extension Movie {
    static let samples: [Movie] =
        [
            .init(
                image: "tenet",
                title: "Tenet",
                description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
                rating: 7.8,
                durationInSecondes: 9000,
                genres: ["Action", "Sci-Fi"],
                releaseDate: .init(timeIntervalSince1970: .init(1599118983)),
                trailerLink: "https://www.youtube.com/watch?v=LdOM0x0XDMo"),
            .init(
                image: "spider-man",
                title: "Spider-Man: Into the Spider-Verse",
                description: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.",
                rating: 8.4,
                durationInSecondes: 7020,
                genres: ["Action", "Animation", "Adventure"],
                releaseDate: .init(timeIntervalSince1970: .init(1544763033)),
                trailerLink: "https://www.youtube.com/watch?v=tg52up16eq0"),
            .init(
                image: "knives-out",
                title: "Knives Out",
                description: "A detective investigates the death of a patriarch of an eccentric, combative family.",
                rating: 7.9,
                durationInSecondes: 7800,
                genres: ["Comedy", "Crime", "Drama"],
                releaseDate: .init(timeIntervalSince1970: .init(1574830233)),
                trailerLink: "https://www.youtube.com/watch?v=qGqiHJTsRkQ"),
            .init(
                image: "guardians-of-the-galaxy",
                title: "Guardians of the Galaxy",
                description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
                rating: 8.0,
                durationInSecondes: 7800,
                genres: ["Action", "Adventure", "Comedy"],
                releaseDate: .init(timeIntervalSince1970: .init(1406868633)),
                trailerLink: "https://www.youtube.com/watch?v=d96cjJhvlMA"),
            .init(
                image: "avengers",
                title: "Avengers: Age of Ultron",
                description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",
                rating: 7.3,
                durationInSecondes: 8460,
                genres: ["Action", "Adventure", "Sci-Fi"],
                releaseDate: .init(timeIntervalSince1970: .init(1430455833)),
                trailerLink: "https://www.youtube.com/watch?v=tmeOjFno6Do"),
        ]
    
    static let sample: Movie = .init(
        image: "tenet",
        title: "Tenet",
        description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
        rating: 7.8,
        durationInSecondes: 9000,
        genres: ["Action", "Sci-Fi"],
        releaseDate: .init(timeIntervalSince1970: .init(1693198233)),
        trailerLink: "https://www.youtube.com/watch?v=LdOM0x0XDMo")
}
