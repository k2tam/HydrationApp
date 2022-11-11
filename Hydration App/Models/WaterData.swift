//
//  WaterData.swift
//  Hydration App
//
//  Created by k2 tam on 05/09/2022.
//

import Foundation

//Data for single day
struct WaterData : Identifiable, Codable{
    var amount:Int
    var drinkID:Int
    var date:Date
    var id:UUID?
    
    init(amount:Int, drink:Int){
        self.amount = amount
        self.drinkID = drink
        self.date = Date()
        self.id = UUID()
    }
}
