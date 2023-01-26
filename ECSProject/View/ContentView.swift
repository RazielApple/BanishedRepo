//
//  ContentView.swift
//  ECSProject
//
//  Created by Fabio Barbato on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            bodyView(colorVM: colorStructViewModel()).tabItem {
                Label("Match", systemImage: "arrow.triangle.2.circlepath.circle.fill")
            }
            
            SavedOutfitView().tabItem {
                Label("Favorites", systemImage: "star.fill")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
