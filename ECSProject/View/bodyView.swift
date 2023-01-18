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
        VStack(spacing: 20){
            
            HStack() {
                    Image("shirt")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(shirtColor)
                        .shadow(radius: 5)
                        .frame(width: 130,height: 130)
                    ColorPicker("", selection: $shirtColor)
//                        .padding(.trailing, 60)
                   
            }
            .padding(.horizontal, 100)
            
                HStack{
                    Image("pants")
                        .renderingMode(.template)
                        .resizable()
                        .shadow(radius: 5)
                        .frame(width: 130,height: 130)
                        .foregroundColor(pantsColor)
                    ColorPicker("", selection: $pantsColor)
//                        .padding(.trailing, 60)

                    
                }
                .padding(.horizontal, 100)
            
                HStack{
                    Image("shoes")
                        .renderingMode(.template)
                        .resizable()
                        .shadow(radius: 5)
                        .foregroundColor(shoesColor)
                        .frame(width: 110,height: 110)
                    ColorPicker("", selection: $shoesColor)
//                        .padding(.trailing, 60)

                    
                
            }
                .padding(.horizontal, 102)
            
           
            

        }

    }
}

struct bodyView_Previews: PreviewProvider {
    static var previews: some View {
        bodyView()
    }
}
