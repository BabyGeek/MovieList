//
//  MovieListTests.swift
//  MovieListTests
//
//  Created by Paul Oggero on 28/08/2023.
//

import XCTest
@testable import MovieList

final class MovieListTests: XCTestCase {
    func testMovieIsNotInWatchlist() {
        let movie = Movie.sample
        XCTAssertFalse(movie.inWatchlist)
    }
    
    func testMovieAddedToWatchlist() {
        let viewModel = MoviesViewModel()
        viewModel.movies = Movie.samples
        viewModel.toggleMovieWatchlist(.sample)
        
        if let movieToTest = viewModel.movies.first(where: { $0.title == Movie.sample.title }) {
            XCTAssertTrue(movieToTest.inWatchlist)
        }
    }
    
    func testViewModelMoviesNotSorted() {
        let viewModel = MoviesViewModel()
        viewModel.movies = Movie.samples
        
        XCTAssertEqual(viewModel.movies.first, Movie.samples.first)
    }
    
    func testViewModelMoviesSortedByTitle() {
        let viewModel = MoviesViewModel()
        viewModel.movies = Movie.samples
        viewModel.sortBy(\.title)
        
        XCTAssertEqual(viewModel.movies.first, .init(
            image: "avengers",
            title: "Avengers: Age of Ultron",
            description: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",
            rating: 7.3,
            durationInSecondes: 8460,
            genres: ["Action", "Adventure", "Sci-Fi"],
            releaseDate: .init(timeIntervalSince1970: .init(1430455833)),
            trailerLink: "https://www.youtube.com/watch?v=tmeOjFno6Do"))
    }
    
    func testViewModelMoviesSortedByReleaseDate() {
        let viewModel = MoviesViewModel()
        viewModel.movies = Movie.samples
        viewModel.sortBy(\.releaseDate)
        
        XCTAssertEqual(viewModel.movies.first, .init(
            image: "guardians-of-the-galaxy",
            title: "Guardians of the Galaxy",
            description: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
            rating: 8.0,
            durationInSecondes: 7800,
            genres: ["Action", "Adventure", "Comedy"],
            releaseDate: .init(timeIntervalSince1970: .init(1406868633)),
            trailerLink: "https://www.youtube.com/watch?v=d96cjJhvlMA"))
    }
}
