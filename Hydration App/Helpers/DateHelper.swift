//
//  Dat/Users/k2tam/Downloads/HydrationApp-main/HydrationApp/Helpers/Constants.swifteHelper.swift
//  Hydration App
//
//  Created by k2 tam on 05/09/2022.
//

import Foundation

class DateHelper {
    
    // Returns the date string of a date instance
    
    static func getStringDate(day: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: day)
    }

    
    // Returns the time string of a date instance
    static func getTimeString(time:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
    
    // Get the current day
    static func getCurrentDay(day: Date) -> Int{
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = format.string(from: day)

        let calendar = Calendar.current
        return calendar.component(.day,from: day)
    }
    
}
