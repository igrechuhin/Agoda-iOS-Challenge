//
//  UITableView+Cells.swift
//  MovieWebService
//
//  Created by Ilya Grechuhin on 30.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

extension UITableView {
  @objc func register(cellClass: AnyClass) {
    register(UINib(cellClass), forCellReuseIdentifier: toString(cellClass))
  }

  @objc func dequeueReusableCell(withCellClass cellClass: AnyClass) -> UITableViewCell? {
    return dequeueReusableCell(withIdentifier: toString(cellClass))
  }

  @objc func dequeueReusableCell(withCellClass cellClass: AnyClass, indexPath: IndexPath) -> UITableViewCell {
    return dequeueReusableCell(withIdentifier: toString(cellClass), for: indexPath)
  }
}

