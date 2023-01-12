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
    
    var body: some View {
        VStack{
            Button {
                isTapped = true
            } label: {
                ZStack{
                    Image("shirt")
                        .resizable()
                        .frame(width: 130,height: 130)
                    Text(Image(systemName: "plus.circle.fill"))
                        .foregroundColor(.mint)
                        .font(.largeTitle)
                    
                }
            }
            Button {
                isTapped = true
            } label: {
                ZStack{
                    Image("pants")
                        .resizable()
                        .frame(width: 130,height: 130)
                    Text(Image(systemName: "plus.circle.fill"))
                        .foregroundColor(.mint)
                        .font(.largeTitle)
                        .padding(.bottom,70)
                    
                }
            }
            Button {
                isTapped = true
            } label: {
                ZStack{
                    Image("shoes")
                        .resizable()
                        .frame(width: 130,height: 130)
                    Text(Image(systemName: "plus.circle.fill"))
                        .foregroundColor(.mint)
                        .font(.largeTitle)
                    
                }
            }
        }

    }
}

struct bodyView_Previews: PreviewProvider {
    static var previews: some View {
        bodyView()
    }
}
