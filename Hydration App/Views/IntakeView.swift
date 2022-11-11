//
//  IntakeView.swift
//  Hydration App
//
//  Created by k2 tam on 08/09/2022.
//

import SwiftUI

struct IntakeView: View {
    
    //View uses waterData instance
    var drink: WaterData
    
    var body: some View {
        HStack{
            //Intake amount
            Text(String(drink.amount)+" mL")
            
            Spacer()
            
            //Type of intake drink
                 Text(String(Constants.drinks[drink.drinkID]))
            
            //Image
            Image(systemName: "drop.fill")
                .foregroundColor(Constants.drinkColors[drink.drinkID])
            
            Text(DateHelper.getTimeString(time: drink.date))
        }
    }
                 
}

struct IntakeView_Previews: PreviewProvider {
    static var previews: some View {
        IntakeView(drink: Constants.sampleModel.intake[0])
    }
}
