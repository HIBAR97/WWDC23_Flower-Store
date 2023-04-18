//
//  File.swift
//  
//
//  Created by Kim Andrew on 2023/04/11.
//

import SwiftUI

struct ProgressMeter: View {
    
    // For driving animation to reveal rectangle with progress meter fill
    @State private var progressMeterOffset = CGSize.zero

    var color : String
    
    var color_step : Double
    
    // Width of the meter
    var meterWidth: CGFloat

    // Thickness of meter's border
    var borderWidth: CGFloat

    // Padding above and below progress meter
    var verticalPadding: CGFloat

    // Needed data to calculate colors and size of meter
    var correctResponses: Double
    var questionCount: Int

    // Percentage of full progress meter
    // If the progress meter is full, this will equal 1.0
    private var fractionOfFullMeter: Double {
        correctResponses / Double(questionCount)
    }
    
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    
                    Spacer()
                    
                    ZStack {

                        VStack(spacing: 0) {
                            
                            // This pushes the filled part of the progress meter down
                            Rectangle()
                                .fill(Color.primary)
                                .colorInvert()
                                .frame(width: meterWidth, height: (geometry.size.height - verticalPadding) - CGFloat(fractionOfFullMeter) * (geometry.size.height - verticalPadding), alignment: .center)
                            
                            
                            // "Fill" for progress meter; stationary
                            if color == "Red" {
                                Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: color_step, green: 0, blue: 0)]),
                                                         startPoint: .bottom,
                                                         endPoint: .top))
                                    .frame(width: meterWidth, height: CGFloat(fractionOfFullMeter) * (geometry.size.height - verticalPadding), alignment: .center)
                                
                            }else if color == "Green"{
                                Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 0, green: color_step, blue: 0)]),
                                                         startPoint: .bottom,
                                                         endPoint: .top))
                                    .frame(width: meterWidth, height: CGFloat(fractionOfFullMeter) * (geometry.size.height - verticalPadding), alignment: .center)
                                
                            }else{
                                Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 0, green: 0, blue: color_step)]),
                                                         startPoint: .bottom,
                                                         endPoint: .top))
                                    .frame(width: meterWidth, height: CGFloat(fractionOfFullMeter) * (geometry.size.height - verticalPadding), alignment: .center)
                            }
                        }
                        
                        // This means the rectangle sliding up will pass beneath this view
                        Rectangle()
                            .fill(Color(hue: 0, saturation: 0, brightness: 0, opacity: 0))
                            .frame(width: meterWidth + borderWidth, height: geometry.size.height - verticalPadding + borderWidth, alignment: .center)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.primary, lineWidth: borderWidth)
                            )

                    }
                    
                    Spacer()

                }
                
                Spacer()
                
            }.frame(width: 50)
        }
    }
}

struct ProgressMeter_Previews: PreviewProvider {
    static var previews: some View {
        ProgressMeter(color: "Green", color_step: 0.75, meterWidth: 100, borderWidth: 2, verticalPadding: 44, correctResponses: 7, questionCount: 10)
    }
}
