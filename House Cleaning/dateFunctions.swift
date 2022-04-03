//
//  dateFunctions.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 4/3/22.
//

import Foundation

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


// func that takes a time duration (String), adds it to today's date, and returns the final date as a string

func dateAdder (duration: String) -> String {
	
	// create duration Int for adder function
	let dayInt = Int(duration) ?? 0
	
	// set reference calendar for adding functions
	let calendar = Calendar.autoupdatingCurrent
	
	// create Date() obj; automatically set to today's date & time
	let currDate = Date()
	
	// CODE JUST FOR REFERENCE: conv ert dateComponents() obj to a Date() obj	
//        guard let currDateObj = calendar.date(from:       currDateComponent) else {
//            return "ADDER ERROR: conversion to Date obj failed"
//        }
	
	// add your day duration to the date passed in to the function
	guard let addedDate = calendar.date(byAdding: .day, value: dayInt, to: currDate) else { return "ADDER ERROR: built in date function failed" }
	
	// convert your added date of Date() obj back to DateComponents() obj
	let dateComponentsOfAdded = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: addedDate)

	// convert DateComponents() obj to a String
	let finalDate = dateToString(date: dateComponentsOfAdded)
	
	return finalDate
}
