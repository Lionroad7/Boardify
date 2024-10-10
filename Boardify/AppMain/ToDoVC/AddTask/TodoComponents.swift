//
//  TodoComponents.swift
//  Boardify
//
//  Created by islombek on 09/10/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
           
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            TextField("Search...", text: $searchText, onEditingChanged: { isEditing in
                self.isEditing = isEditing
            })
            .padding(8)
            .padding(.leading, -8) // Adjusting padding for alignment with icon
            .background(Color(red: 223/255, green: 245/255, blue: 213/255).opacity(0.4))
            .cornerRadius(20)
            .onTapGesture {
                self.isEditing = true
            }
            

            if isEditing {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
                .transition(.scale)
            }
        }
        .padding(.horizontal, 1)
        .padding(.vertical, 1)
        .background(Color(red: 223/255, green: 245/255, blue: 213/255))
        .cornerRadius(20)
        .onTapGesture {
            self.isEditing = true
        }
        .animation(.easeInOut(duration: 0.2), value: isEditing) 
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}

