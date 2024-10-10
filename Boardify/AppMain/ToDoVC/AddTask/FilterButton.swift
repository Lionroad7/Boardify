//
//  FilterButton.swift
//  Boardify
//
//  Created by islombek on 09/10/24.
//

import SwiftUI

struct FilterButton: View {
    @Binding var filterPriority: String?
    let priorities = ["High", "Medium", "Easy"]
    
    var body: some View {
        Button(action: {
            toggleFilter()
        }) {
            Label("Filter", systemImage: "line.horizontal.3.decrease.circle")
                .font(.system(size: 17))
                .foregroundColor(.black)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 8)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 192/255, green: 211/255, blue: 184/255), lineWidth: 2)
        )
        .cornerRadius(20)
    }

    func toggleFilter() {

        if let currentFilter = filterPriority {
            
            if let currentIndex = priorities.firstIndex(of: currentFilter) {

                if currentIndex < priorities.count - 1 {
                    filterPriority = priorities[currentIndex + 1]
                } else {
                    filterPriority = nil
                }
            }
        } else {
            filterPriority = priorities.first
        }
    }
}

