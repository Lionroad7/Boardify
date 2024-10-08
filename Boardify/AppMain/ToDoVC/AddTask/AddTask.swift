//
//  AddTask.swift
//  Boardify
//
//  Created by islombek on 09/10/24.
//

import SwiftUI

struct AddANewTaskView: View {
    @Binding var tasks: [Task]
    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @State private var taskDueDate: Date = Date()
    @State private var taskPriority: String = "Low"
    
    let priorities = ["Low", "Medium", "High"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Add a New Task")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Task Title", text: $taskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Task Description", text: $taskDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            DatePicker("Due Date", selection: $taskDueDate, displayedComponents: .date)
                .padding(.horizontal)
            
            Picker("Priority", selection: $taskPriority) {
                ForEach(priorities, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            Button(action: saveTask) {
                Text("Save Task")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top, 40)
    }
    
    private func saveTask() {
        let newTask = Task(title: taskTitle,
                           description: taskDescription,
                           dueDate: formatDate(taskDueDate),
                           priority: taskPriority,
                           commentsCount: 5,
                           progress: 0.0)
        tasks.append(newTask) // Add the new task to the tasks array
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct AddANewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        // For preview, we can use an empty task array
        AddANewTaskView(tasks: .constant([]))
    }
}
