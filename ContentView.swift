//  ContentView.swift
//  ai_project
//
//  Created by Erwin on 24.02.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea() // Растягиваем фон на весь экран
            
            LaunchView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
