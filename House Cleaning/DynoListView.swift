//
//  DynoListView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/14/22.
//

import SwiftUI
import Foundation

struct DynoListView: View {
	@ObservedObject var datas = ReadData()
	@State var overdue = false


    var body: some View {
		
		//List(datas.users){ user in
		List {
			ForEach(datas.users) {
				let user = $0
				let today = Date()
				let todayDateComponents = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: today)
				let today_str = dateToString(date: todayDateComponents)
				/*if (user.date < today_str) {
					overdue.toggle()
				}*/
				//print(today_str)
				
				OverdueListItemView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas, name: user.name, date: user.date)
					.edgesIgnoringSafeArea(.all)

				/*
				HStack{
					CheckboxView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas)
				//}

					VStack(alignment: .leading) {
						Text(user.name)
							.font(.title)
							.fontWeight(.heavy)
							.foregroundColor(Color.gray)
						HStack{
							Text(user.duration)
								.font(.title3)
								.foregroundColor(Color.red)
							Spacer()
							Text(user.date)
								.font(.title3)
						}
					}
				}
				*/
			}

		}
	}
}

struct DynoListView_Previews: PreviewProvider {
    static var previews: some View {
        DynoListView()
    }
}
