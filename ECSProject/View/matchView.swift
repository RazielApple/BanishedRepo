//
//  matchView.swift
//  ECSProject
//
//  Created by Giovanni Maresca on 11/01/23.
//

import SwiftUI

struct matchView: View {
    @State var isTapped = false
    var prova: colorStructViewModel
    var body: some View {
        //            Button {
        //                isTapped = true
        //            } label: {
        //                ZStack{
        //                    Rectangle()
        //                        .frame(width: 180,height: 80)
        //                        .foregroundColor(.mint)
        //                        .cornerRadius(20)
        //                    Text("Match")
        //                        .font(.largeTitle)
        //                        .foregroundColor(.white)
        //                }
        //            }
//        NavigationLink {
//            colorMatchView()
//        } label: {
            Button {
                Task{
                     await prova.getLearner()
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


      //  }
        
        
        
    }
}

//struct matchView_Previews: PreviewProvider {
//    static var previews: some View {
//        matchView()
//    }
//}
