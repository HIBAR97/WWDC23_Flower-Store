import SwiftUI
import SpriteKit

func Comparison_Color (quiz: [[Double]], arr_N: Int, r: Double, g: Double, b: Double ) -> Bool{
    if quiz[arr_N][0] == r && quiz[arr_N][1] == g && quiz[arr_N][2] == b{
        print("\(r) \(g) \(b)")
        return true
    }else {
        print("\(r) \(g) \(b)")
        return false
    }
}

struct Game_Page: View {
    
    //Player Color View
    @State private var Red_Step : Double = 0.0
    @State private var Green_Step : Double = 0.0
    @State private var Blue_Step : Double = 0.0
    
    //Quiz Number
    @State private var Quiz_Num = 0
    @State private var Right_Answer = 0
    @State private var Quiz_End = false
    
    //Quiz String
    @State private var Quiz_String = ["Green", "Red", "Blue",
                                      "Magenta", "Yellow", "Cyan",
                                      "White"]
    
    //Quiz
    @State private var Quiz = [[0.0, 1.0, 0.0], [1.0, 0.0, 0.0], [0.0, 0.0, 1.0],
                               [1.0, 0.0, 1.0], [1.0, 1.0, 0.0], [0.0, 1.0, 1.0],
                               [1.0, 1.0, 1.0], [0.6000000000000001, 0.6000000000000001, 0.6000000000000001], [0.2, 0.6000000000000001, 0.0],
                               [0.0, 0.8, 0.6000000000000001], [0.6000000000000001, 0.8, 0.0], [0.4, 0.0, 0.6000000000000001],
                               [0.0, 0.4, 0.6000000000000001],[1.0, 1.0, 1.0]]
    
    @State private var Quiz_Answer = false
    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                
                VStack{
                    Image("Flower_Shop_Deck")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500)
                }
               
                VStack{
                    HStack{
                        
                        Text("Remaining Quiz \n \(Quiz_Num) / 13")
                            .multilineTextAlignment(.center)
                        
                        VStack { //Animation View
                            
                            if (Quiz_Num < 7){
                                Text("I would like to have a \(Quiz_String[Quiz_Num]) Flower")
                                    .frame(width: 500)
                            }else {
                                Text("I would like to have a flower in this color")
                                    .frame(width: 500)
                            }
                            
                            //Problem Preview
                            
                            Image("Flower")
                                .renderingMode(.template)
                                .foregroundColor(Color(red: Quiz[Quiz_Num][0], green: Quiz[Quiz_Num][1], blue: Quiz[Quiz_Num][2]))
                                .padding(15)
                                .border(.black)
                        }
                        
                        Text("Right Answer \n\(Right_Answer) / 13")
                            .multilineTextAlignment(.center)
                        
                    }
                  
                    
                    Spacer()
                    //SpriteView(scene: SKScene())
                  
                    VStack{ //Find Color View
                        
                        //User Preview
                        if (Red_Step < 0.1 && Green_Step < 0.1 && Blue_Step < 0.1){
                            Image("Flower")
                            }else {
                                Image("Flower")
                                    .renderingMode(.template)
                                    .foregroundColor(Color(red: Red_Step, green: Green_Step, blue: Blue_Step))
                            }
                        
                        
                
                        HStack{ //Progress bar
                            VStack{ //Red Progress
                                ProgressMeter(color: "Red", color_step: Red_Step, meterWidth: 50, borderWidth: 2, verticalPadding: 50, correctResponses: Red_Step * 5, questionCount: 5).offset(x: 25)
                                
                                //Text("Red : \(Red_Step)")
                                Text("Red")
                                    .foregroundColor(Color(red: 1, green: 0, blue: 0))
                                Stepper(value: $Red_Step , in: 0...1, step: 0.2) {
                                }.labelsHidden()
                            }.frame(width: 100, height: 400)
                                .padding(.bottom, 40)
                                //.background(Color.red)
                            
                            VStack{ //Green Progress
                                ProgressMeter(color: "Green", color_step: Green_Step, meterWidth: 50, borderWidth: 2, verticalPadding: 50, correctResponses: Green_Step * 5, questionCount: 5).offset(x: 25)
                                
                                Text("Green")
                                    .foregroundColor(Color(red: 0, green: 1, blue: 0))
                                Stepper(value: $Green_Step , in: 0...1, step: 0.2) {
                                }.labelsHidden()
                            }.frame(width: 100, height: 400)
                                .padding(.bottom, 40)
                            
                            VStack{ //Blue Progress
                                ProgressMeter(color: "Blue", color_step: Blue_Step, meterWidth: 50, borderWidth: 2, verticalPadding: 50, correctResponses: Blue_Step * 5, questionCount: 5).offset(x: 25)
                                
                                Text("Blue")
                                    .foregroundColor(Color(red: 0, green: 0, blue: 1))
                                Stepper(value: $Blue_Step , in: 0...1, step: 0.2) {
                                }.labelsHidden()
                            }.frame(width: 100, height: 400)
                                .padding(.bottom, 40)
                            
                        }.frame(width: 300, height: 400)
                    
                        //Quiz End?
                        if Quiz_End{
                            NavigationLink(destination: End_Page(Point: Right_Answer)){
                                Text("Done!")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.black)
                                
                            }
                            
                        }else {
                            
                            Button {
                                
                                //Comparison Color
                                if Comparison_Color(quiz: Quiz, arr_N: Quiz_Num, r: Red_Step, g: Green_Step, b: Blue_Step) && Quiz_Num <= 13{
                                    if Quiz_Num < 13{
                                        Quiz_Num += 1
                                    }else {
                                        Quiz_End = true
                                    }
                                    Right_Answer += 1
                                    
                                    //Reset
                                    Red_Step = 0.0; Green_Step = 0.0; Blue_Step = 0.0
                                    
                                }else if !Comparison_Color(quiz: Quiz, arr_N: Quiz_Num, r: Red_Step, g: Green_Step, b: Blue_Step){
                                    if Quiz_Num < 13{
                                        Quiz_Num += 1
                                    } else{
                                        Quiz_End = true
                                    }
                                    Red_Step = 0.0; Green_Step = 0.0; Blue_Step = 0.0
                                }
                                
                            } label: {
                                Text("Done!")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                }
                
            }
        }.navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct Game_Page_Previews: PreviewProvider {
    static var previews: some View {
        Game_Page()
    }
}


