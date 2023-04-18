//
//  SwiftUIView.swift
//  
//
//  Created by Kim Andrew on 2023/04/17.
//

import SwiftUI

struct End_Page: View {
    
    let Point: Int
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Text(" \(Point) Point!")
                    .font(.system(size : 100))
                    .foregroundColor(.white)
                    .padding(.top, 100)
                
                Spacer()
                
                NavigationLink(destination: Game_Page()) {
                    Text("Retry")
                        .font(.system(size : 100))
                        .foregroundColor(.white)
                        .padding(.top, 100)
                }
                
                NavigationLink(destination: Main_Page()) {
                    Text("Home")
                        .font(.system(size : 100))
                        .foregroundColor(.white)
                }
                
            }
            
            .frame(width: 900)
            .background(Color.black)
        }.navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}
