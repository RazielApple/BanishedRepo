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

    @State private var shirtColor = Color(red: 1, green: 1, blue: 0)
    @State private var pantsColor = Color(red: 0, green: 0, blue: 0)
    @State private var shoesColor = Color(red: 0, green: 0, blue: 0)
    var body: some View {
        VStack(spacing: 20){
            HStack() {
                ZStack {
                    
                    if(isShirtTapped){
                        Image("shirtFilled")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(shirtColor)
                            .frame(width: 120,height: 120)
                            .onTapGesture{
                                isShirtTapped = true
                            }
                    }
                    Image("blankShirt")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 130,height: 130)
                        .onTapGesture{
                            isShirtTapped = true
                        }
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
                ZStack {
                    
                    if(isPantsTapped){
                        Image("pantsFilled")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(pantsColor)
                            .frame(width: 120,height: 120)
                            .onTapGesture{
                                isPantsTapped = true
                            }
                    }
                    Image("pants")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 130,height: 130)
                        .onTapGesture{
                            isPantsTapped = true
                        }
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
                ZStack {
                    
                    if(isShoesTapped){
                        Image("shoesFilled")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(shoesColor)
                            .frame(width: 120,height: 120)
                            .onTapGesture{
                                isShoesTapped = true
                            }
                    }
                    Image("blankShoes")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 130,height: 130)
                        .onTapGesture{
                            isShoesTapped = true
                        }
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
            
            HStack{
                Button {
                    vm.addOutfit(hexShirtIN: "001BE9", hexPantsIN: "3DC461", hexShoesIN: "FF0000")
                } label: {
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 180,height: 80)
                            .foregroundColor(!(isShirtTapped || isPantsTapped || isShoesTapped) ? Color(red: 132/255, green: 192/255, blue: 226/255) : Color.red)
                            .cornerRadius(20)
                        Text("Save")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                    }.shadow(radius: 3)
                }.disabled(!(isShirtTapped || isPantsTapped || isShoesTapped))
                    .shadow(radius: 0)
            }
            
            Button {
                Task{
                    if (isShirtTapped){
                        await pickColors(shirtColor, &pantsColor, &shoesColor)
                    }
                    else if (isPantsTapped) {
                        await pickColors(pantsColor, &shirtColor, &shoesColor)
                    }
                    else if (isShoesTapped) {
                        await pickColors(shoesColor, &shirtColor, &pantsColor)
                    }
                }
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: 180,height: 80)
                        .foregroundColor(!(isShirtTapped || isPantsTapped || isShoesTapped) ? Color(red: 33/255, green: 114/255, blue: 159/255) : Color.blue)
                        .cornerRadius(20)
                    Text("Match")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }.shadow(radius: 3)
            }.disabled(!(isShirtTapped || isPantsTapped || isShoesTapped))
                .shadow(radius: 0)
        }
        }
            
    func pickColors(_ chosenClothColor: Color, _ firstNotChosenClothColor: inout Color, _ secondNotChosenClothColor: inout Color) async  {
        array = await colorVM.matchColors(r: Double((chosenClothColor.cgColor?.components![0])!),g: Double((chosenClothColor.cgColor?.components![1])!),b: Double((chosenClothColor.cgColor?.components![2])!))
        if (array.count != 0){
            firstNotChosenClothColor = Color(red: Double((array[0].cgColor?.components![0])!), green: Double((array[0].cgColor?.components![1])!), blue: Double((array[0].cgColor?.components![2])!))
            secondNotChosenClothColor = Color(red: Double((array[1].cgColor?.components![0])!), green: Double((array[1].cgColor?.components![1])!), blue: Double((array[1].cgColor?.components![2])!))
        }else{
            firstNotChosenClothColor = Color.black
            secondNotChosenClothColor = Color.gray
        }
        isShirtTapped = true
        isPantsTapped = true
        isShoesTapped = true
    }
    }



struct bodyView_Previews: PreviewProvider {
    static var previews: some View {
        bodyView(colorVM: colorStructViewModel())
    }
}
