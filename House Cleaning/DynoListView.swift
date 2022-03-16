//
//  DynoListView.swift
//  House Cleaning
//
//  Created by Chris Van Buren and Kaitlyn on 3/14/22.
//

import SwiftUI
import Foundation


struct DynoListView: View {

    
    // creation of custom dateComponents struct, no longer needed since DateComponents() does the trick, but can be an example for future reference
//    struct dateComponents {
//        var calendar = Int?(nil)
//        var timeZome = Int?(nil)
//        var year = Int?(nil)
//        var month = Int?(nil)
//        var day = Int?(nil)
//
//// initialize all variables actively used within the dateComponents object
//
//        public init(month: Int, year: Int, day: Int) {
//            self.month = month
//            self.year = year
//            self.day = day
//        }
//    }
    
    
// <======= USED CODE STARTS HERE =========>
    
// function that transforms a DateComponents object from its current data type into String type for in-app display
    
// returns in yyyy-MM-dd format
// TO DO: NEED TO ENSURE THAT THERE IS ZERO PADDING TO LEFT IN SINGLE DIGIT DAYS AND MONTHS

    func toString (date: DateComponents) -> String {
        var yearInt = date.year
        var monthInt = date.month
        var dayInt = date.day
        
        var yearStr = yearInt != nil ? String(yearInt!) : "";
        
        var monthStr = monthInt != nil ? String(monthInt!) : "";
        
        var dayStr = dayInt != nil ? String(dayInt!) : "";
        
        return (yearStr + "-" + monthStr + "-" + dayStr)
    }


    var body: some View {
        
        // build a single date components object
        var testDate = DateComponents(calendar: Calendar.current, year: 1998, month: 1, day: 24)
        
        var strDateTest = toString(date: testDate)
        
        Text(strDateTest)
        
        }
                
    }


struct DynoListView_Previews: PreviewProvider {
    static var previews: some View {
        DynoListView()
    }
}
