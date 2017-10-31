//
//  DetailsView.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsView: MWSView, DetailsViewApi, TappableLabelDelegate {
  public var director: MWSDirector!

  private let directorName = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 30))
  private let directorNameValue = UILabel(frame: CGRect(x: 20, y: 150, width: 200, height: 30))
  private lazy var tapToShowMore: TappableLabel = {
    let label = TappableLabel(frame: CGRect(x: 20, y: 200, width: 200, height: 30))
    label.delegate = self
    return label
  }()
  private let actorName = UILabel(frame: CGRect(x: 20, y: 240, width: 200, height: 30))
  private let actorScreenName = UILabel(frame: CGRect(x: 20, y: 270, width: 200, height: 30))

  private var detailsDisplayData: DetailsDisplayDataApi {
    return displayData as! DetailsDisplayDataApi
  }

  // MARK: Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(directorName)
    view.addSubview(directorNameValue)
    view.addSubview(tapToShowMore)
    view.addSubview(actorName)
    view.addSubview(actorScreenName)
  }

  func setup() {
    let displayData = detailsDisplayData

    view.backgroundColor = displayData.backgroundColor
    directorName.text = displayData.directorNameTitle
    directorNameValue.text = director.name
    tapToShowMore.text = displayData.showMoreActionTitle

    let actor = director.film.actors.first!
    actorName.text = actor.name
    actorName.isHidden = true
    actorScreenName.text = actor.screenName
    actorScreenName.isHidden = true
  }

  // MARK: DetailsViewInput

  func didReceiveTouch() {
    actorName.isHidden = false
    actorScreenName.isHidden = false
  }
}
