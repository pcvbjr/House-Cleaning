//
//  DynoListView.swift
//  House Cleaning
//
//  Created by Chris Van Buren and Kaitlyn on 3/14/22.
//

import SwiftUI
import Foundation

struct DynoListView: View {
    
    // returns in yyyy-MM-dd format
    // TO DO: NEED TO ENSURE THAT THERE IS ZERO PADDING TO LEFT IN SINGLE DIGIT DAYS AND MONTHS
        func dateToString (date: DateComponents) -> String {
            var yearInt = date.year
            var monthInt = date.month
            var dayInt = date.day
            
            var yearStr = yearInt != nil ? String(yearInt!) : "";
            
            var monthStr = monthInt != nil ? String(monthInt!) : "";
            
            var dayStr = dayInt != nil ? String(dayInt!) : "";
            
            return (yearStr + "-" + monthStr + "-" + dayStr)
        }
    
    // func that takes a String and returns in a DateComponents obj
        func stringToDate (string: String) -> DateComponents {
            // split String into an array by separator
            let date = string.components(separatedBy: "-")
            // assign variables to each array item
            let yearStr = date[0]
            let monthStr = date[1]
            let dayStr = date[2]
            
            // convert String to Int type. If String value
            // is not a number, make the var an Int w/value 0
            let yearInt = Int(yearStr) ?? 0
            let monthInt = Int(monthStr) ?? 0
            let dayInt = Int(dayStr) ?? 0
            
            
            // create DateComponents object
            let finalDate = DateComponents(calendar: Calendar.autoupdatingCurrent, year: yearInt, month: monthInt, day: dayInt)
            
            // return it
            
            return finalDate
        }
    
    // func that takes a date (String) and time duration (String), adds them together, and returns the final date as a string
    
    func dateAdder (currDate: String, duration: String) -> String {
        // create initial dateComponents() obj
        let currDateComponent = stringToDate(string: currDate)
        
        // create duration Int for adder function
        let dayInt = Int(duration) ?? 0
        
        // set reference calendar for adding functions
        let calendar = Calendar.autoupdatingCurrent
        
        // convert dateComponents() obj to a Date() obj
        guard let currDateObj = calendar.date(from: currDateComponent) else {
            return "ADDER ERROR: conversion to Date obj failed"
        }
        
        // add your day duration to the date passed in to the function
        guard let addedDate = calendar.date(byAdding: .day, value: dayInt, to: currDateObj) else { return "ADDER ERROR: built in date function failed" }
        
        // convert your added date of Date() obj back to DateComponents() obj
        let dateComponentsOfAdded = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: addedDate)

        // convert DateComponents() obj to a String
        let finalDate = dateToString(date: dateComponentsOfAdded)
        
        return finalDate
    }
    
    var body: some View {
        // build a single date components object
               var testDate = DateComponents(calendar: Calendar.autoupdatingCurrent, year: 1998, month: 1, day: 24)
               
               var strDateTest = dateToString(date: testDate)
               
        
        var testString = "2022-1-13"
        var testDurationString = "20"
        
        var dateAdded = dateAdder(currDate: testString, duration: testDurationString)
        
//        var dateObj = stringToDate(string: testString)
//        var backToString = dateToString(date: dateObj)

//        let myCal = Calendar(identifier: .iso8601)
//        let finalDate = myCal.date(from: dateObj)
        
        VStack{
            Text("This is a dateAdder test: " + dateAdded)

        }
               }
}

struct DynoListView_Previews: PreviewProvider {
    static var previews: some View {
        DynoListView()
    }
}
