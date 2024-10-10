//
//  TaskCardView.swift
//  Boardify
//
//  Created by islombek on 09/10/24.
//

import SwiftUI

struct TaskCardView: View {
    
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(task.priority)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(task.priorityColor)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "ellipsis")
            }
            
            Text(task.title)
                .font(.headline)
                .fontWeight(.bold)
            
            Text(task.description)
                .font(.body)
                .foregroundColor(.gray)
            
            HStack {
                Image(systemName: "calendar")
                Text(task.dueDate)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Image(systemName: "message")
                Text("\(task.commentsCount)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                Text(task.progressText)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            ProgressView(value: task.progress)
                .progressViewStyle(LinearProgressViewStyle(tint: .green))
            
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(17)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        .padding(.bottom, 8)
    }
}
