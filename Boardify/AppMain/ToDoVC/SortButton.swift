//
//  SortButton.swift
//  Boardify
//
//  Created by islombek on 09/10/24.
//

import SwiftUI

struct SortButton: View {
    var body: some View {
        Button(action: {
            // Add sorting functionality
        }) {
            Label("Sort by", systemImage: "arrow.up.arrow.down.circle")
                .font(.system(size: 17))
                .foregroundColor(.black)
        }.padding(.vertical, 5)
            .padding(.horizontal, 9)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 192/255, green: 211/255, blue: 184/255), lineWidth: 2)
            )
            .cornerRadius(20)
           
    }
}
