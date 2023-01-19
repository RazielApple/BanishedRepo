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
    
    func getLearner() async {
        do {
            urlComponents?.path = "/scheme"
            urlComponents?.queryItems = [
                URLQueryItem (name: "rgb",
                              value:"0,71,171"),
                URLQueryItem (name: "mode", value: "analogic-complement"),
                URLQueryItem(name: "count", value: "3")
            ]
            
            let url = urlComponents?.url
            let request = URLRequest(url: url!)
            let (data,_) = try await URLSession.shared.data(for: request)
//            let str = String(decoding: data, as: UTF8.self)
//            print(str)
            self.colors = try decoder.decode(ColorStruct.self, from: data)
            print(self.colors?.colors[0].rgb.r)
            print(self.colors?.colors[1].rgb.b)
            print(self.colors?.colors[2].rgb.g)

        } catch {
            print (error.localizedDescription)
        }
    }
}
