//
//  AddIntakeView.swift
//  Hydration App
//
//  Created by k2 tam on 08/09/2022.
//

import SwiftUI

struct AddIntakeView: View {
    
    var hydration: HydrationModel
    
    @Binding var isShowAddIntake: Bool
    
    @State var amountIntakeIndex: Int = 9
    @State var drinkIndex: Int = 0
    
    var body: some View {
        
        VStack(spacing: 20){
            
            //Headline
            Text("New Intake")
                .bold()
                .font(Font.largeTitle)
                .padding(.vertical)
            
            
            Picker("", selection: $drinkIndex) {
                ForEach(0..<Constants.drinks.count){i in
                    Text(Constants.drinks[i])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            
            //Drop icon that corresponds to selected drink type
            Image(systemName: "drop.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(Constants.drinkColors[drinkIndex])
            
            //Amount intake picker
            Picker("", selection: $amountIntakeIndex) {
                ForEach(0..<51){ index in
                    Text("\(Constants.Config.intakeIncrement + Constants.Config.intakeIncrement*index) mL")
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            
            Button {
                //Save intake data and dissmiss this sheet
                
                //Save the data
                hydration.addIntake(amount: Constants.Config.intakeIncrement + Constants.Config.intakeIncrement * amountIntakeIndex, drink: drinkIndex)
                
                isShowAddIntake = false
                
            } label: {
                HStack{
                    Text("Save")
                    
                    Image(systemName: "square.and.arrow.down")
                }
                .frame(width: 200, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            }
            .buttonStyle(customButtonStyle())

                
            
        }
        .padding(.horizontal)
    }
}

struct AddIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        AddIntakeView(hydration: Constants.sampleModel, isShowAddIntake: Binding.constant(true))
    }
}
