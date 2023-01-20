//
//  bodyView.swift
//  ECSProject
//
//  Created by Giovanni Maresca on 11/01/23.
//

import SwiftUI

struct bodyView: View {
    var colorVM: colorStructViewModel
    @State var array = [Color]()
    
    @State var isShirtTapped = false
    @State var isPantsTapped = false
    @State var isShoesTapped = false
    
    @State private var shirtColor = Color(red: 0, green: 0, blue: 0)
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
            Button {
                Task{
                   await pickColors()
                }
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 180,height: 80)
                        .foregroundColor(.mint)
                        .cornerRadius(20)
                    Text("Match")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            
        }

    }
    
    func pickColors() async {
        if(isShirtTapped){
            array = await colorVM.matchColors(r: Double((shirtColor.cgColor?.components![0])!),g: Double((shirtColor.cgColor?.components![1])!),b: Double((shirtColor.cgColor?.components![2])!))
            if (array.count != 0){
                pantsColor = Color(red: Double((array[0].cgColor?.components![0])!), green: Double((array[0].cgColor?.components![1])!), blue: Double((array[0].cgColor?.components![2])!))
                shoesColor = Color(red: Double((array[1].cgColor?.components![0])!), green: Double((array[1].cgColor?.components![1])!), blue: Double((array[1].cgColor?.components![2])!))
                isPantsTapped = true
                isShoesTapped = true
            }else{
                pantsColor = Color.black
                shoesColor = Color.gray
            }
        }
        else if (isPantsTapped){
            array = await colorVM.matchColors(r: Double((pantsColor.cgColor?.components![0])!),g: Double((pantsColor.cgColor?.components![1])!),b: Double((pantsColor.cgColor?.components![2])!))
            if (array.count != 0){
                shirtColor = Color(red: Double((array[0].cgColor?.components![0])!), green: Double((array[0].cgColor?.components![1])!), blue: Double((array[0].cgColor?.components![2])!))
                shoesColor = Color(red: Double((array[1].cgColor?.components![0])!), green: Double((array[1].cgColor?.components![1])!), blue: Double((array[1].cgColor?.components![2])!))
                isShirtTapped = true
                isShoesTapped = true
            }else{
                shirtColor = Color.black
                shoesColor = Color.gray
            }
        }
        else if (isShoesTapped){
            array = await colorVM.matchColors(r: Double((shoesColor.cgColor?.components![0])!),g: Double((shoesColor.cgColor?.components![1])!),b: Double((shoesColor.cgColor?.components![2])!))
            if (array.count != 0){
                shirtColor = Color(red: Double((array[0].cgColor?.components![0])!), green: Double((array[0].cgColor?.components![1])!), blue: Double((array[0].cgColor?.components![2])!))
                pantsColor = Color(red: Double((array[1].cgColor?.components![0])!), green: Double((array[1].cgColor?.components![1])!), blue: Double((array[1].cgColor?.components![2])!))
                isShirtTapped = true
                isPantsTapped = true
            }else{
                shirtColor = Color.black
                pantsColor = Color.gray
            }
        }
    }
}



struct bodyView_Previews: PreviewProvider {
    static var previews: some View {
        bodyView(colorVM: colorStructViewModel())
    }
}
