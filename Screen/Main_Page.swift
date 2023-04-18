//
//  SwiftUIView.swift
//  
//
//  Created by Kim Andrew on 2023/04/17.
//

import SwiftUI

struct Main_Page: View {
    var body: some View {
        NavigationView {
                VStack{
                    
                    Image("Flower_Shop")
                    
                    Spacer()
                    
                    NavigationLink(destination: Game_Page()) {
                        Text("Open Shop")
                            .font(.system(size: 30))
                            .background(Image("textBox")
                                .resizable()
                                .frame(width: 200, height: 70))
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    NavigationLink(destination: Free_Form()) {
                        Text("Free Form")
                            .font(.system(size: 30))
                            .background(Image("textBox")
                            .resizable()
                            .frame(width: 200, height: 70))
                    }
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Button("Quit"){
                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                        }
                        .font(.system(size: 30))
                        .background(Image("textBox")
                        .resizable()
                        .frame(width: 200, height: 70))
                    
                    Spacer()
                }
          }.navigationViewStyle(.stack)
            .navigationBarBackButtonHidden(true)
      }
    }


struct Main_Page_Previews: PreviewProvider {
        static var previews: some View {
            Main_Page()
        }
    }

