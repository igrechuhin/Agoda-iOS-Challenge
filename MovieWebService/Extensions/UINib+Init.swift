//
//  UINib+Init.swift
//  MovieWebService
//
//  Created by Ilya Grechuhin on 30.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

extension UINib {
  @objc convenience init(_ viewClass: AnyClass, bundle: Bundle? = nil) {
    self.init(nibName: toString(viewClass), bundle: bundle)
  }
}
