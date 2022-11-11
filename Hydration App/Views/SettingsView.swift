//
//  SettingsView.swift
//  Hydration App
//
//  Created by k2 tam on 06/09/2022.
//

import SwiftUI

struct SettingsView: View {
    
    // View writes to both the hydration model and health model
    @ObservedObject var hydration: HydrationModel
    
    // presentationMode property used to close the sheet
    @State var existingGoalIndex:Int
    
    @Binding var isShowSettings: Bool
    
    
    var body: some View {
        
        VStack{
            //Header
            Text("Settings")
                .bold()
                .font(Font.largeTitle)
            
            //Set goal
            Text("Set your goal")
                .font(Font.body)
                .padding(.top)
            
            
            
            //Picker
            Picker("", selection: $existingGoalIndex) {
                ForEach(0..<42) { number in
                    Text("\(Constants.Config.goalIncrement*number+Constants.Config.baseGoal) mL")
                }
            }
            .pickerStyle(.wheel)
            
            //Action buttons
            
            //Save Goal Button
            Button(action: {
                
                //Save new goal to model
                hydration.saveGoal(index: existingGoalIndex)
                
                //Dismiss this sheet
                isShowSettings = false
            
                
            }, label: {
                HStack {
                    Text("Save Goal")
                    Image(systemName: "square.and.arrow.down")
                }
                .frame(width: 200, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .buttonStyle(customButtonStyle())

            
            //Log to Health Button
            Button {
                
            } label: {
                HStack{
                    Text("Log to Health")
                    Image(systemName: "heart.circle.fill")
                }
                .frame(width: 200, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .buttonStyle(secondaryButtonStyle())

            Spacer()
            
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 15)

                
                Text("Logging to health deletes all intake listings from this app! Intake is logged and reset automatically at the start of each day")
                    .bold()
                    .font(.caption)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.leading)
                    .padding()
                
            }
            .frame(width: 350, height: 100)
            
            Spacer()
            
        }
        .padding(.top, 20)
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(hydration: Constants.sampleModel, existingGoalIndex: 17, isShowSettings: Binding.constant(true))
    }
}
