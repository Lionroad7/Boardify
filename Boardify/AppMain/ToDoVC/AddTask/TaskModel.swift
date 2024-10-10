//
//  TaskModel.swift
//  Boardify
//
//  Created by islombek on 09/10/24.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let dueDate: String
    let priority: String
    let commentsCount: Int
    let progress: Double
}

extension Task {
    var progressText: String {
        return "\(Int(progress * 100))%"
    }
    
    var priorityColor: Color {
        switch priority {
        case "High":
            return .red
        case "Medium":
            return .orange
        default:
            return .green
        }
    }
}
