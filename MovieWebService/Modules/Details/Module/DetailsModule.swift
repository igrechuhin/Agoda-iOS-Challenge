//
//  DetailsModule.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

@objc class DetailsModule: MWSModule {
  @objc static func build(movie: MWSFilm) -> MWSModule {
    return build(with: DetailsView(),
                 interactor: DetailsInteractor(movie: movie),
                 presenter: DetailsPresenter(),
                 router: DetailsRouter(),
                 displayData: nil)
  }
}
