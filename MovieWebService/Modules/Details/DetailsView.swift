//
//  DetailsView.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

final class DetailsView: MWSView, DetailsViewApi, TappableLabelDelegate {
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

  private var actorExpanded = false {
    didSet {
      actorName.isHidden = !actorExpanded
      actorScreenName.isHidden = !actorExpanded

      let displayData = detailsDisplayData
      tapToShowMore.text = actorExpanded ? displayData.showLessActionTitle : displayData.showMoreActionTitle
    }
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    addSubviews()
  }

  private func addSubviews() {
    view.addSubview(directorName)
    view.addSubview(directorNameValue)
    view.addSubview(tapToShowMore)
    view.addSubview(actorName)
    view.addSubview(actorScreenName)
  }

  // MARK: - DetailsViewApi

  func setup() {
    let displayData = detailsDisplayData

    view.backgroundColor = displayData.backgroundColor
    directorName.text = displayData.directorNameTitle

    actorExpanded = false
  }

  func dataUpdated(model: DetailsViewModel) {
    directorNameValue.text = model.directorName
    actorName.text = model.actorName
    actorScreenName.text = model.actorScreenName
  }

  // MARK: - DetailsViewInput

  func didReceiveTouch() {
    actorExpanded = !actorExpanded
  }
}
