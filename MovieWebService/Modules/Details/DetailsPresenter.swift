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

//MARK: - MWSPresenterProtocol
  override func viewHasLoaded() {
    super.viewHasLoaded()
    let view = detailsView
    view.setup()
  }
}
