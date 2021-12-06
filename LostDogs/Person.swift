//
//  Person.swift
//  LostDogs
//
//  Created by AMStudent on 12/3/21.
//

import Combine

class Person: ObservableObject {
    let name: String
    let username: String
    @Published var bio: String
    
init(
    name: String = "Name",
    username: String = "Username",
    bio: String = "",
    readMe: Bool = true
) {
    self.name = name
    self.username = username
    self.bio = bio
  }
}

extension Person: Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
       lhs === rhs
    }
}
