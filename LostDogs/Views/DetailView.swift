//
//  DetailView.swift
//  LostDogs
//
//  Created by AMStudent on 12/3/21.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    @ObservedObject var person: Person
    @Binding var image: UIImage?
    @State var showingImagePicker = false
    @State var showingAlert = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack(spacing: 16) {
                Person.Image(
                    uiImage: image,
                    title: person.name,
                    cornerRadius: 16
                )
                    .frame(width: 150, height: 150)

                NameAndUsernameStack(
                    person: person,
                    nameFont: .title,
                    usernameFont: .title2
                )
            }
            
            VStack {
                Divider()
                    .padding(.vertical)
                TextField("Bio...", text: $person.bio)
                Divider()
                    .padding(.vertical)
            }
            
            VStack {
                

                let updateButton =
                Button("Update Image...") {
                showingImagePicker = true
            }
                .padding()
                
                
                if image != nil {
                HStack {
                    Spacer()
                    Button("Delete Image") {
                       showingAlert = true
                    }
                    
                    Spacer()
                    
                    updateButton
                    
                    Spacer()
                 }
                }  else {
                    updateButton
                }
            }
            
           Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
            .alert(isPresented: $showingAlert) {
                .init(
                    title: .init("Delete Image for \(person.name)?"),
                                 primaryButton: .destructive(.init("Delete")) {
                                    image = nil
                                 },
                                 secondaryButton: .cancel())
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}


