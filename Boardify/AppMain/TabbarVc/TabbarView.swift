//
//  TabbarView.swift
//  Boardify
//
//  Created by islombek on 08/10/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ToDoView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("To do")
                }

            OnProgressView()
                .tabItem {
                    Image(systemName: "hourglass")
                    Text("On progress")
                }

            DoneView()
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Done")
                }
        }.navigationBarHidden(true)
    }
}



struct OnProgressView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Tasks in progress will be displayed here.")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("On progress")
        }
    }
}

struct DoneView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Completed tasks will be displayed here.")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("Done")
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
