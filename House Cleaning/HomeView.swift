//
//  HomeView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI

struct HomeView: View {
	//@State var checked: [Bool] = [false, false, true, false, true]
	

	
	// TODO: dynamically make $checked list for each element in json file, do this outside of views
	@ObservedObject var datas = ReadData();
	

	

    var body: some View {
		
		List(datas.users){ user in

			HStack{
				CheckboxView(checked: $datas.checked[user.id-1])
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
		}
		
		/*VStack {
			Text("HomeView page")
			HStack {
				CheckboxView(checked: $checked)
				Text("Element that requires checkmark!")
					.padding()
			}
		}*/
		
		
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
