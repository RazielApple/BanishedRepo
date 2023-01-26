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
    
    @ObservedObject var outfitVM = PersistanceManager()

    var body: some View {
        NavigationStack{
            
            LazyVGrid(columns: layout){
                ForEach(outfitVM.savedEntities){ outfit in
                    VStack{
                        Image("shirtFilled")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 70,height: 70)
                            .foregroundColor(hexToRGB(hex:outfit.hexShirt!))
                        Image("pantsFilled")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 70,height: 70)
                            .foregroundColor(hexToRGB(hex:outfit.hexPant!))
                        Image("shoesFilled")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 70,height: 70)
                            .foregroundColor(hexToRGB(hex:outfit.hexShoes!))
                            .padding(.top,-20)
                        Text(outfit.outfitName!)
                    }
                }
            }.navigationTitle("Favorites")
                .padding(.top,-90)
                .onAppear(perform: outfitVM.fetchColors)
        }
    }
    
    private func hexToRGB(hex: String) -> Color {
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        if hex.count != 6 {
            return Color.white
        }
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        return Color(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                     green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                     blue: CGFloat(rgb & 0x0000FF) / 255.0)
    }
}

struct SavedOutfitView_Previews: PreviewProvider {
    static var previews: some View {
        SavedOutfitView()
    }
}
