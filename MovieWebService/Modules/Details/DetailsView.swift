//
//  DetailsView.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

final class DetailsView: MWSView, DetailsViewApi {
  enum Config {
    static let xOffset = CGFloat(20)
    static let boxSize = CGSize(width: 200, height: 30)
    static let reducedFontSize = CGFloat(14)
  }

  private let directorTitle = UILabel(frame: CGRect(origin: CGPoint(x: Config.xOffset, y: 80), size: Config.boxSize))
  private let directorName: UILabel = {
    let label = UILabel(frame: CGRect(origin: CGPoint(x: Config.xOffset, y: 120), size: Config.boxSize))
    label.font = label.font.withSize(Config.reducedFontSize)
    return label
  }()

  private lazy var tapToShowMore = MWSTappableLabel(frame: CGRect(origin: CGPoint(x: Config.xOffset, y: 180), size: Config.boxSize), delegate: self)!

  private let actorNameTitle = UILabel(frame: CGRect(origin: CGPoint(x: Config.xOffset, y: 220), size: Config.boxSize))
  private let actorName: UILabel = {
    let label = UILabel(frame: CGRect(origin: CGPoint(x: Config.xOffset, y: 260), size: Config.boxSize))
    label.font = label.font.withSize(Config.reducedFontSize)
    return label
  }()

  private let actorScreenNameTitle = UILabel(frame: CGRect(origin: CGPoint(x: Config.xOffset, y: 300), size: Config.boxSize))
  private let actorScreenName: UILabel = {
    let label = UILabel(frame: CGRect(origin: CGPoint(x: Config.xOffset, y: 340), size: Config.boxSize))
    label.font = label.font.withSize(Config.reducedFontSize)
    return label
  }()

  private var detailsDisplayData: DetailsDisplayDataApi {
    return displayData as! DetailsDisplayDataApi
  }

  private var actorExpanded = false {
    didSet {
      actorNameTitle.isHidden = !actorExpanded
      actorName.isHidden = !actorExpanded
      actorScreenNameTitle.isHidden = !actorExpanded
      actorScreenName.isHidden = !actorExpanded

      let displayData = detailsDisplayData
      tapToShowMore.text = actorExpanded ? displayData.showLessActionTitle : displayData.showMoreActionTitle
    }
  }

  // MARK: - Helpers

  private func addSubviews() {
    view.addSubview(directorTitle)
    view.addSubview(directorName)
    view.addSubview(tapToShowMore)
    view.addSubview(actorNameTitle)
    view.addSubview(actorName)
    view.addSubview(actorScreenNameTitle)
    view.addSubview(actorScreenName)
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    addSubviews()
  }

  // MARK: - DetailsViewApi

  func setup() {
    let displayData = detailsDisplayData

    view.backgroundColor = displayData.backgroundColor
    title = displayData.title
    directorTitle.text = displayData.directorNameTitle
    actorNameTitle.text = displayData.actorNameTitle
    actorScreenNameTitle.text = displayData.actorScreenNameTitle

    actorExpanded = false
  }

  func dataUpdated(model: DetailsViewModel) {
    directorName.text = model.directorName
    actorName.text = model.actorName
    actorScreenName.text = model.actorScreenName
  }
}

extension DetailsView: MWSTappableLabelDelegate {
  func didReceiveTouch() {
    actorExpanded = !actorExpanded
  }
}
