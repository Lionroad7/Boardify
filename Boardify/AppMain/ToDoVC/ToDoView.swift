//
//  ToDoView.swift
//  Boardify
//
//  Created by islombek on 08/10/24.
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

struct ToDoView: View {
    @State private var showAddTaskView = false
    @State private var tasks: [Task] = [
        
        Task(title: "Set Up Development Environment",
             description: "Configure web hosting and server settings\nInstall necessary CMS and development tools\nSet up version control system [eg.Git]",
             dueDate: "Nov 2nd, 2024",
             priority: "High",
             commentsCount: 2,
             progress: 0.25),
        Task(title: "Design High-Fidelity Mockups",
             description: "Create detailed mockups that represent the final design of the website.",
             dueDate: "Nov 2nd, 2024",
             priority: "Medium",
             commentsCount: 6,
             progress: 0.70),
        
        Task(title: "Design High-Fidelity Mockups",
             description: "Create detailed mockups that represent the final design of the website.",
             dueDate: "Nov 2nd, 2024",
             priority: "Easy",
             commentsCount: 3,
             progress: 0.44)
    ]
    
    var body: some View {
           NavigationView {
               VStack {
                   HStack {
                       FilterButton()
                       SortButton()
                       Spacer()
                       AddNewTaskButton(action: {
                           showAddTaskView = true
                       })
                       .sheet(isPresented: $showAddTaskView) {
                           AddANewTaskView()
                       }
                   }
                   .padding(.horizontal)
                   
                   Text("To-do")
                       .font(.largeTitle)
                       .fontWeight(.bold)
                       .padding(.leading)
                       .frame(maxWidth: .infinity, alignment: .leading)
                   
                   ScrollView {
                       ForEach(tasks) { task in
                           TaskCardView(task: task)
                       }
                   }
                   .padding(.horizontal)
               }
               .navigationTitle("")
               .navigationBarHidden(true)
           }
       }
   
}

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

struct FilterButton: View {
    var body: some View {
        Button(action: {
            // Add filter functionality
        }) {
            Label("Filter", systemImage: "line.horizontal.3.decrease.circle")
                .font(.system(size: 17))
                .foregroundColor(.black)
        }.padding(.vertical, 5)
            .padding(.horizontal, 8)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 192/255, green: 211/255, blue: 184/255), lineWidth: 2)
            )
            .cornerRadius(20)
           
    }
}

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

struct AddNewTaskButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action() // Call the action closure to handle adding new task
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                Text("Add New Task")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 8)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}

