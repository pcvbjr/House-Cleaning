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
		checkFileInDocsDir()
		//updateStatuses()
		loadData()
		//var fileObj = try? ReadData.loadJSON(withFilename: fileName)
	}
	
	func sortByDate() {
		users = users.sorted(by: { $0.date <= $1.date })
	}
	
	
	func checkFileInDocsDir() {
		let docsPath = getDocumentsDirectory()
		let docsUrl = try? NSURL(resolvingAliasFileAt: docsPath).appendingPathComponent("test_json.json")

		if let pathComponent = docsUrl {
				let filePath = pathComponent.path
				let fileManager = FileManager.default
				if fileManager.fileExists(atPath: filePath) {
					print("FILE AVAILABLE")                    // set fileExists to true

				} else {
					print("FILE NOT AVAILABLE")
					copyFromBundleToDocsDir()
				}
			} else {
				print("FILE PATH NOT AVAILABLE")               // set fileExists to false
				copyFromBundleToDocsDir()
			}
	}
	
	func copyFromBundleToDocsDir() {
		var bundleFilePath = Bundle.main.url(forResource: fileName, withExtension: fileExtension)!
		
		let dataStr = try? String(contentsOf: bundleFilePath, encoding: .utf8)

		let url = getDocumentsDirectory().appendingPathComponent("test_json.json")
		
		do {
			try dataStr!.write(to: url, atomically: true, encoding: .utf8)
		}
		catch {
			Swift.print("could not write dataStr to docs dir")
		}
	}
	
	func loadData()  {
		
		
		//let docsPathStr = try? String(contentsOf: docsPath)
		//let docsFilePathStr = docsPathStr! + "/test_json.json"
		
		
		

		let url = try? FileManager.default
			.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
			.appendingPathComponent(fileName)
			.appendingPathExtension(fileExtension)
		
		print("---> reading file: \(url!)")

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



