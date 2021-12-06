//
//  PersonViews.swift
//  LostDogs
//
//  Created by AMStudent on 12/3/21.
//

import SwiftUI


struct NameAndUsernameStack: View {
    let person: Person
    let nameFont: Font
    let usernameFont: Font
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(person.name)
                .font(nameFont)
            Text(person.username)
                .font(usernameFont)
                .foregroundColor(.secondary)
        }
        
    }
}
extension Person {
    struct Image: View {
        let uiImage: UIImage?
        let title: String
        var size: CGFloat?
        let cornerRadius: CGFloat
        
        var body: some View {
            if let image = uiImage.map(SwiftUI.Image.init) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadius)
                
            } else {
            let symbol =
                SwiftUI.Image(title: title)
                ?? .init(systemName: "person.fill")
            
            symbol
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
            }
        }
    }
}

struct Person_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                NameAndUsernameStack(
                    person: .init(),
                    nameFont: .title,
                    usernameFont: .title2
                )
            }
            Person.Image(title: Person().name)
            Person.Image(title: "")
            Person.Image(title: "🙋‍♂️")
         }
            .previewedInAllColorSchemes
    }
}

extension Image {
    init?(title: String) {
        guard
        let character = title.first,
        case let symbolName = "\(character.lowercased()).square",
        UIImage(systemName: symbolName) != nil
        else {
        return nil
        }
        self.init(systemName: symbolName)
    }
}

extension Person.Image {
    /// A preview image.
    init(title: String) {
        self.init(
            uiImage: nil,
            title: title,
            cornerRadius: .init()
        )
    }
}

extension View {
    var previewedInAllColorSchemes: some View {
        ForEach(
            ColorScheme.allCases, id: \.self,
            content: preferredColorScheme)
    }
}

