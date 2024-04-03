//
//  TodoListApp.swift
//  TodoList
//
//  Created by Daniil Shutkin on 31.03.2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                SplashScreenView()
            }
            //For IPad
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
