//
//  Tasks.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/14/22.
//

import Foundation


struct User: Codable, Identifiable {
	enum CodingKeys: CodingKey {
		case name
		case duration
		case date
		case id
		//case checked
	}
	
	//var id = UUID()
	var id: Int
	var name: String
	var duration: String
	var date: String
	//var date: checked
}

class ReadData: ObservableObject  {
	@Published var users = [User]()
	@Published var checked = [Bool]()
	
		
	init(){
		loadData()
	}
	
	func loadData()  {
		guard let url = Bundle.main.url(forResource: "test_json", withExtension: "json")
			else {
				print("Json file not found")
				return
			}
		
		let data = try? Data(contentsOf: url)
		let users = try? JSONDecoder().decode([User].self, from: data!)
		self.users = users!
		
		for user in self.users {
			checked = checked + [false]
		}
		print(self.checked)
		
	}
	 
}
