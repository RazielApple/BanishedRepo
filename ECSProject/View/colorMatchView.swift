//
//  colorMatchView.swift
//  ECSProject
//
//  Created by Giovanni Maresca on 13/01/23.
//

import SwiftUI

struct colorMatchView: View {
    @State private var color1 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
       @State private var color2 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    @State private var isMatched = false 
    
    var body: some View {
        NavigationStack{
            VStack {
                
                Spacer()
                HStack {
                    Rectangle().fill(color1)
                    Rectangle().fill(color2)
                }
                Spacer()
                Button(action: {
                    self.color1 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
                    self.color2 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
                    self.isMatched = (self.color1 == self.color2)
                }) {
                    ZStack{
                        Rectangle()
                            .frame(width: 150,height: 50)
                            .cornerRadius(20)
                            .foregroundColor(.mint)
                        Text("Check Match")
                            .foregroundColor(.white)
                    }
                }
            }.navigationTitle("Match Colors")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct colorMatchView_Previews: PreviewProvider {
    static var previews: some View {
        colorMatchView()
    }
}
