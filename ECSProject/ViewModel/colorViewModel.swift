//
//  colorStructViewModel.swift
//  ECSProject
//
//  Created by Giovanni Maresca on 18/01/23.
//

import SwiftUI

@MainActor
class colorStructViewModel: ObservableObject {
    
    @Published var colors : ColorStruct?
    let decoder = JSONDecoder()
    var urlComponents = URLComponents(string: "https://www.thecolorapi.com")
    
    func matchColors(r:Double, g:Double, b:Double) async -> [Color]{
        var firstColor, secondColor: Color
        var matchedColors = [Color]()
        do {
            urlComponents?.path = "/scheme"
            urlComponents?.queryItems = [
                URLQueryItem (name: "rgb",
                              value:"\(r),\(g),\(b)"),
                URLQueryItem (name: "mode", value: "analogic-complement"),
                URLQueryItem(name: "count", value: "3")
            ]
            
            let url = urlComponents?.url
            let request = URLRequest(url: url!)
            let (data,_) = try await URLSession.shared.data(for: request)

            self.colors = try decoder.decode(ColorStruct.self, from: data)
            firstColor = Color(hex: colors!.colors[0].hex.clean)
            secondColor = Color(hex: colors!.colors[1].hex.clean)
            
            matchedColors.append(firstColor)
            matchedColors.append(secondColor)
            
        } catch {
            print (error.localizedDescription)
        }
        
        return matchedColors
    }
    
   /* private func hexToRGB(hex: String) -> Color {
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
    }*/

}
