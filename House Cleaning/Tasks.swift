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
	
	var fileName = "test_json"
	var fileExtension = "json"
	

		
	init(){
		loadData()
		//var fileObj = try? ReadData.loadJSON(withFilename: fileName)
	}
	
	func sortByDate() {
		users = users.sorted(by: { $0.date <= $1.date })
	}
	
	
	func loadData()  {
		/*guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
			else {
				print("Json file not found")
				return
			}*/
		let url = try? FileManager.default
			.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
			.appendingPathComponent(fileName)
			.appendingPathExtension(fileExtension)
		
		print("---> reading file: \(url)")

		var data = try? Data(contentsOf: url!)
		var users = try? JSONDecoder().decode([User].self, from: data!)
		self.users = users!
		
		for user in self.users {
			checked = checked + [false]
		}
		//print(self.checked)
		sortByDate()
		
	}
	
// TODO: writeData() furl does not match loadData() url. These must match in order to read and write to the same file!
	func writeData() {
		do {
			let furl = try FileManager.default
				.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
				.appendingPathComponent(fileName)
				.appendingPathExtension(fileExtension)
			print("---> writing to: \(furl)")
			let data = try JSONEncoder().encode(users)
			try data.write(to: furl)
		} catch {
			print("---> error saveToFile: \(error)")

		}
		//ReadData.save(jsonObject: fileObj, toFilename: fileName)
		sortByDate()
		print(users)

	}
	
	func reloadData() {
		print("reload data")
		loadData()
		sortByDate()
		print(users)

	}
	 
}



