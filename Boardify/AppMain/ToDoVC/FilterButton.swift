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

    // Function to toggle through priorities
    func toggleFilter() {

        if let currentFilter = filterPriority {
            // Find the index of the current filter
            if let currentIndex = priorities.firstIndex(of: currentFilter) {
                // Check if we can move to the next priority in the list
                if currentIndex < priorities.count - 1 {
                    filterPriority = priorities[currentIndex + 1] // Move to next priority
                } else {
                    filterPriority = nil
                }
            }
        } else {
            // If no filter is set, start with the first priority
            filterPriority = priorities.first
        }
    }
}

