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
    var urlComponents = URLComponents(string: "https://www.thecolorapi.com/id?rgb=0,71,171")
    
    func getLearner() async {
        do {
            urlComponents?.path = "/id"
            urlComponents?.queryItems = [
                URLQueryItem (name: "rgb",
                              value:"0,71,171")
            ]
            
            let url = urlComponents?.url
            let request = URLRequest(url: url!)
            let (data,_) = try await URLSession.shared.data(for: request)
            self.colors = try decoder.decode(ColorStruct.self, from: data)
            print(colors!.rgb)
        } catch {
            print (error.localizedDescription)
        }
    }
}
