//
//  SavedOutfitView.swift
//  ECSProject
//
//  Created by Giovanni Maresca on 25/01/23.
//

import SwiftUI

struct SavedOutfitView: View {
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())

    ]
    var body: some View {
        NavigationStack{
            LazyVGrid(columns: layout){
                VStack{
                    Image("shirtFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                    Image("pantsFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                    Image("shoesFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                        .padding(.top,-20)
                    Text("Outfit1")
                    
                }
                VStack{
                    Image("shirtFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                    Image("pantsFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                    Image("shoesFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                        .padding(.top,-20)
                    Text("Outfit1")
                    
                }
                VStack{
                    Image("shirtFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                    Image("pantsFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                    Image("shoesFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                        .padding(.top,-20)
                    Text("Outfit1")
                    
                }
                VStack{
                    Image("shirtFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                    Image("pantsFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                    Image("shoesFilled")
                        .resizable()
                        .frame(width: 70,height: 70)
                        .padding(.top,-20)
                    Text("Outfit1")
                    
                }
            }.navigationTitle("Favorites")
                .padding(.top,-90)
        }
    }
}

struct SavedOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        SavedOutfitView()
    }
}
