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
    
    @Environment(\.presentationMode) var presentationMode // Add this to dismiss the sheet
    
    let priorities = ["Low", "Medium", "High"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Text("Add a New Task")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .background(Color(red: 154/255, green: 222/255, blue: 99/255))
                    .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Task Title", text: $taskTitle)
                        .font(.title3)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                        .padding(.horizontal)
                        .frame(maxHeight: taskTitle.isEmpty ? 50 : .infinity) // Dynamic height adjustment
                    
                    TextEditor(text: $taskDescription)
                        .font(.body)
                        .padding()
                        .frame(height: 120) // Fixed height for description
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                        .padding(.horizontal)
                }
                
                DatePicker("Due Date", selection: $taskDueDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                    .padding(.horizontal)
                
                Picker("Priority", selection: $taskPriority) {
                    ForEach(priorities, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                .padding(.horizontal)
                
                Button(action: saveTask) {
                    Text("Save Task")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 4)
                }
                .padding(.horizontal)
                
                HStack {
                    
                }.padding(.top, 430)
            }
        }
        .padding(.top, 40)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func saveTask() {
        let newTask = Task(title: taskTitle,
                           description: taskDescription,
                           dueDate: formatDate(taskDueDate),
                           priority: taskPriority,
                           commentsCount: 0,
                           progress: 0.12)
        tasks.append(newTask) // Add the new task to the tasks array
        

        presentationMode.wrappedValue.dismiss()
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct AddANewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddANewTaskView(tasks: .constant([]))
    }
}
