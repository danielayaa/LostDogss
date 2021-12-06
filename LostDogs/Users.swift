//
//  Users.swift
//  LostDogs
//
//  Created by AMStudent on 12/3/21.
//

import Foundation

import class UIKit.UIImage

struct Users {
  var sortedPeople: [Person] { personsCache }

  /// An in-memory cache of the manually-sorted books that are persistently stored.
  private var personsCache: [Person] = [
    .init(name: "Daniel", username: "danyboyy"),
    .init(name: "Noah",username: "noah.2021"),
    .init(name: "Zion", username: "zeezee"),
    .init(name: "Tyler",username: "tylerroni"),
    
  ]
    
    var uiImages: [Person: UIImage] = [:]
}
