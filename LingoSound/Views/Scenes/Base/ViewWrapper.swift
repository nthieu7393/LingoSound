//
//  ViewWrapper.swift
//  LingoSound
//
//  Created by hieu nguyen on 23/06/2024.
//

import SwiftUI

struct ViewWrapper<Content: View>: View {
    
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        ZStack(alignment: .center, content: {
            //            Rectangle()
            //                .fill(Color.bgView)
            ////                .border(Color.border, width: 4)
            //                .clipShape(RoundedRectangle(cornerRadius: 30))
            //                .overlay(alignment: .bottom) {
            //
            //                }
            
            
            RoundedRectangle(
                cornerRadius: 30,
                style: .continuous)
            .fill(Color.bgView)
            .strokeBorder(Color.border, style: StrokeStyle(lineWidth: 4, dash: [15]))
            //            .stroke(
            //                    Color.border,
            //                    style: StrokeStyle(
            //                        lineWidth: 4,
            //                        dash: [15],
            //                        dashPhase: 20))
            
            
            
            content()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            //                .background(Image("bg-image")
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fill)
            //                    .edgesIgnoringSafeArea(.all))
        })
        .background(Image("bg-image"))
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        //        .ignoresSafeArea(.all)
        
    }
}

