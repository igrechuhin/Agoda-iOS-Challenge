//
//  DetailsPresenter.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

final class DetailsPresenter: MWSPresenter, DetailsPresenterApi {
  private var detailsView: DetailsViewApi {
    return view as! DetailsViewApi
  }

  private var detailsInteractor: DetailsInteractorApi {
    return interactor as! DetailsInteractorApi
  }

  // MARK: - Helpers

  private func fetchMovie() {
    let interactor = detailsInteractor

    interactor.getMovie { [weak self] movie in
      guard let director = movie.director,
        let actor = movie.actors.first else { return }
      let model = DetailsViewModel(directorName: director.name, actorName: actor.name, actorScreenName: actor.screenName)

      DispatchQueue.main.async {
        guard let `self` = self else { return }
        let view = self.detailsView
        view.dataUpdated(model: model)
      }
    }
  }

  // MARK: - MWSPresenterProtocol

  override func viewHasLoaded() {
    super.viewHasLoaded()
    let view = detailsView
    view.setup()
    fetchMovie()
  }
}
