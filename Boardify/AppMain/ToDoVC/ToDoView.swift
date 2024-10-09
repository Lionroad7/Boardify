//
//  ToDoView.swift
//  Boardify
//
//  Created by islombek on 08/10/24.
//

import SwiftUI

struct ToDoView: View {
    
    @State private var filterPriority: String? = nil
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
                    Text("To-do")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                 
                    SearchBar(searchText: .constant(""))
                        .padding(.leading, -70)
                    Spacer()
                }
                
                HStack {
                    FilterButton(filterPriority: $filterPriority)
                    SortButton()
                    Spacer()
                    AddNewTaskButton(action: {
                        showAddTaskView = true
                    })
                    .sheet(isPresented: $showAddTaskView) {
                        AddANewTaskView(tasks: $tasks) // Pass the actual tasks array
                    }
                }
                .padding(.horizontal)

                
                ScrollView {
                    ForEach(tasks.filter { task in
                        if let filterPriority = filterPriority {
                            return task.priority == filterPriority
                        } else {
                            return true
                        }
                    }) { task in
                        TaskCardView(task: task)
                    }
                }
                .padding(.horizontal)
                .scrollIndicators(.hidden)

            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}

