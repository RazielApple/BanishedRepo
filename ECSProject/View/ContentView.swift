//
//  ContentView.swift
//  ECSProject
//
//  Created by Fabio Barbato on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack{
                bodyView()
                matchView()
            }.navigationTitle("Unleash your Style")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
