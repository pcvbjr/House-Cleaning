//
//  DynoListView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/14/22.
//

import SwiftUI
import Foundation

struct DynoListView: View {
	let formatter = DateFormatter()
	
    var body: some View {
		/*formatter.dateFormat = "yyyy/MM/dd"
		let myDate = "2021/09/12"
		var date_obj = formatter.date(from: myDate)
		Text(formatter.string(from: date_obj))*/
		Text("Hello there")
    }
}

struct DynoListView_Previews: PreviewProvider {
    static var previews: some View {
        DynoListView()
    }
}
