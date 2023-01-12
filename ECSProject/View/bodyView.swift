//
//  bodyView.swift
//  ECSProject
//
//  Created by Giovanni Maresca on 11/01/23.
//

import SwiftUI

struct bodyView: View {
    @State var isTapped = false
    @State var isTapped2 = false
    @State var isTapped3 = false
    
    @State private var shirtColor =
                Color(.black)
    @State private var pantsColor =
                Color(.black)
    @State private var shoesColor =
                Color(.black)
    var body: some View {
        VStack{
            
                ZStack{
                    Image("shirt")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(shirtColor)
                        .frame(width: 130,height: 130)
                    ColorPicker("", selection: $shirtColor)
                        .padding(.trailing, 60)

                    
                
            }
            
                ZStack{
                    Image("pants")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 130,height: 130)
                        .foregroundColor(pantsColor)
                    ColorPicker("", selection: $pantsColor)
                        .padding(.trailing, 60)

                    
                }
            
                ZStack{
                    Image("shoes")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(shoesColor)
                        .frame(width: 130,height: 130)
                    ColorPicker("", selection: $shoesColor)
                        .padding(.trailing, 60)

                    
                
            }
        }

    }
}

struct bodyView_Previews: PreviewProvider {
    static var previews: some View {
        bodyView()
    }
}
