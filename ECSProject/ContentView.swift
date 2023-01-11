//
//  ContentView.swift
//  ECSProject
//
//  Created by Fabio Barbato on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("jungle differences")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
