//
//  DetailsInteractor.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

final class DetailsInteractor: MWSInteractor, DetailsInteractorApi {
  private let movie: MWSFilm

  init(movie: MWSFilm) {
    self.movie = movie
    super.init()
  }

  // MARK: - DetailsInteractorApi

  func getMovie(callback: @escaping FetchMovieCallback) {
    DispatchQueue.global(qos: .userInteractive).async {
      callback(self.movie)
    }
  }
}
