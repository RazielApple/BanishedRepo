//
//  bodyView.swift
//  ECSProject
//
//  Created by Giovanni Maresca on 11/01/23.
//

import SwiftUI

struct bodyView: View {
    @State var isShirtTapped = false
    @State var isPantsTapped = false
    @State var isShoesTapped = false
    
    @State private var shirtColor = Color(.black)
    @State private var pantsColor = Color(.black)
    @State private var shoesColor = Color(.black)
    var body: some View {
        VStack(spacing: 20){
            HStack() {
                Image(isShirtTapped ? "shirt" : "blankShirt")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(shirtColor)
                        .shadow(radius: 5)
                        .frame(width: 130,height: 130)
                        .onTapGesture{
                            isShirtTapped = true
                        }
                Text(Image(systemName: "minus.circle.fill"))
                    .font(.system(size: 20))
                    .foregroundColor(.red)
                    .padding(.bottom, 100)
                    .offset(x: -15)
                    .opacity(isShirtTapped ? 1.0 : 0.0)
                    .onTapGesture{
                        isShirtTapped = false
                        shirtColor = .black
                    }
                    ColorPicker("", selection: $shirtColor)
                    .opacity(isShirtTapped ? 1.0 : 0.0)
                    .padding(.trailing, 50)
                   
            }
            .padding(.leading, 125)
            
            HStack{
                Image(isPantsTapped ? "pants" : "blankPants")
                    .renderingMode(.template)
                    .resizable()
                    .shadow(radius: 5)
                    .frame(width: 130,height: 130)
                    .foregroundColor(pantsColor)
                    .onTapGesture{
                        isPantsTapped = true
                    }
                Text(Image(systemName: "minus.circle.fill"))
                    .font(.system(size: 20))
                    .foregroundColor(.red)
                    .padding(.bottom, 100.0)
                    .offset(x: -15)
                    .opacity(isPantsTapped ? 1.0 : 0.0)
                    .onTapGesture{
                        isPantsTapped = false
                        pantsColor = .black
                    }
                ColorPicker("", selection: $pantsColor)
                    .opacity(isPantsTapped ? 1.0 : 0.0)
                    .padding(.trailing, 50)
                
            }
                .padding(.leading, 125)
            
            HStack{
                Image(isShoesTapped ? "shoes" : "blankShoes")
                    .renderingMode(.template)
                    .resizable()
                    .shadow(radius: 5)
                    .foregroundColor(shoesColor)
                    .frame(width: 110,height: 110)
                    .onTapGesture{
                        isShoesTapped = true
                    }
                Text(Image(systemName: "minus.circle.fill"))
                    .font(.system(size: 20))
                    .foregroundColor(.red)
                    .padding(.bottom, 100)
                    .offset(x: -15)
                    .onTapGesture{
                        isShoesTapped = false
                        shoesColor = .black
                    }
                    .opacity(isShoesTapped ? 1.0 : 0.0)
                ColorPicker("", selection: $shoesColor)
                    .opacity(isShoesTapped ? 1.0 : 0.0)
                    .padding(.trailing, 50)
                
            
        }
                .padding(.leading, 135)
            
        }

    }
}

struct bodyView_Previews: PreviewProvider {
    static var previews: some View {
        bodyView()
    }
}
