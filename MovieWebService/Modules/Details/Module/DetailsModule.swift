//
//  DetailsModule.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

@objc class DetailsModule: NSObject {

  @objc func build(with data: Any) -> UIViewController {

    let viewController = DetailsViewController()

    let router = DetailsRouter()
    router.viewController = viewController

    let presenter = DetailsPresenter()
    presenter.view = viewController
    presenter.router = router

    let interactor = DetailsInteractor()
    interactor.output = presenter

    presenter.interactor = interactor
    viewController.output = presenter
    viewController.director = data as? MWSDirector

    return viewController
  }
}
