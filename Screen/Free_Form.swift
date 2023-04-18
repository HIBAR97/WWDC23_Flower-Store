//
//  SwiftUIView.swift
//  
//
//  Created by Kim Andrew on 2023/04/18.
//

import SwiftUI

struct Free_Form: View {
    
    @State private var Red_Step = 0.0
    @State private var Green_Step = 0.0
    @State private var Blue_Step = 0.0
    
    
    var body: some View {
        
        let Red_2Step = Int(Red_Step * 100)
        let Green_2Step = Int(Green_Step * 100)
        let Blue_2Step = Int(Blue_Step * 100)
        
        NavigationView{
            VStack{
                
                Text("Create You Personal Flower")
                
                Image("Flower")
                    .renderingMode(.template)
                    .foregroundColor(Color(red: Red_Step, green: Green_Step, blue: Blue_Step))
                
                Spacer()
                    .frame(height: 50)
                
                Text(" Red \(Red_2Step) \n Green \(Green_2Step) \n Blue \(Blue_2Step)")
                
                Spacer()
                    .frame(height: 50)
                
                HStack{ //Progress bar
                    VStack{ //Red Progress
                        ProgressMeter(color: "Red", color_step: Red_Step, meterWidth: 50, borderWidth: 2, verticalPadding: 50, correctResponses: Red_Step * 5, questionCount: 5).offset(x: 25)
                    }.frame(width: 100, height: 400)
                        .padding(.bottom, 40)
                        
                    
                    VStack{ //Green Progress
                        ProgressMeter(color: "Green", color_step: Green_Step, meterWidth: 50, borderWidth: 2, verticalPadding: 50, correctResponses: Green_Step * 5, questionCount: 5).offset(x: 25)
                        
                    }.frame(width: 100, height: 400)
                        .padding(.bottom, 40)
                    
                    VStack{ //Blue Progress
                        ProgressMeter(color: "Blue", color_step: Blue_Step, meterWidth: 50, borderWidth: 2, verticalPadding: 50, correctResponses: Blue_Step * 5, questionCount: 5).offset(x: 25)
                       
                    }.frame(width: 100, height: 400)
                        .padding(.bottom, 40)
                    
                }.frame(width: 300, height: 400)
                
                VStack{
                    Text("Red")
                        .foregroundColor(Color(red: 1, green: 0, blue: 0))
                   Slider(value: $Red_Step, in: 0...1)
                    
                    Text("Green")
                        .foregroundColor(Color(red: 0, green: 1, blue: 0))
                    Slider(value: $Green_Step, in: 0...1)
                    
                    Text("Blue")
                        .foregroundColor(Color(red: 0, green: 0, blue: 1))
                    Slider(value: $Blue_Step, in: 0...1)
                }.frame(width: 500)
            }
        }.navigationViewStyle(.stack)
    }
}

struct Free_Form_Previews: PreviewProvider {
    static var previews: some View {
        Free_Form()
    }
}
