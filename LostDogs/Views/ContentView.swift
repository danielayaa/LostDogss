//
//  ContentView.swift
//  LostDogs
//
//  Created by AMStudent on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var users = Users()
    
    var body: some View {
        NavigationView {
            List(users.sortedPeople) { person in
            PersonRow(
                person: person,
                image: $users.uiImages[person]
            )
        }
        .navigationBarTitle("Friends")
        }
    }
}

struct PersonRow: View {
    @ObservedObject var person: Person
    @Binding var image: UIImage?
    
    var body: some View {
        NavigationLink(
            destination: DetailView(person: person, image: $image)
        ) {
            HStack {
                Person.Image(
                    uiImage: image,
                    title: person.name,
                    size: 80,
                    cornerRadius: 12
                )
            
                VStack(alignment: .leading) {
                    NameAndUsernameStack(
                        person: person,
                        nameFont: .title2,
                        usernameFont: .title3
                    )
                    
                    if !person.bio.isEmpty {
                    Spacer()
                    Text(person.bio)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                  }
                }
                .lineLimit(1)
                    
                Spacer()
                
            
           }
            .padding(.vertical, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewedInAllColorSchemes
    }
}
