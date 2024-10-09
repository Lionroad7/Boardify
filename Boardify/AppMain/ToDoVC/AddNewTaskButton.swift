//
//  AddNewTaskButton.swift
//  Boardify
//
//  Created by islombek on 09/10/24.
//

import SwiftUI

struct AddNewTaskButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                Text("Add New Task")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
            .background(Color(red: 154/255, green: 222/255, blue: 99/255))
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 192/255, green: 211/255, blue: 184/255), lineWidth: 2)
            )
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
}

