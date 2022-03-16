//
//  DynoListView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/14/22.
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
	
	// takes a String and transforms to a DateComponents obj
	// returns in TBD format
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
			let finalDate = DateComponents(calendar: Calendar.current, year: yearInt, month: monthInt, day: dayInt)
			
			// return it
			
			return finalDate
		}
	
    var body: some View {
		// build a single date components object
			   var testDate = DateComponents(calendar: Calendar.current, year: 1998, month: 1, day: 24)
			   
			   var strDateTest = dateToString(date: testDate)
			   
		
		var testString = "1998-1-13"
		var dateObj = stringToDate(string: testString)
		var backToString = dateToString(date: dateObj)

//		let myCal = Calendar(identifier: .iso8601)
//		let finalDate = myCal.date(from: dateObj)
		
		VStack{
			Text("This is a string test: " + strDateTest)
			Text("Thru both converter functions: " + backToString)

		}
			   }
}

struct DynoListView_Previews: PreviewProvider {
    static var previews: some View {
        DynoListView()
    }
}
