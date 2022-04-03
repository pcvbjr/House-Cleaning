//
//  DynoListView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/14/22.
//

import SwiftUI
import Foundation

struct DynoListView: View {
	@ObservedObject var datas = ReadData();


    var body: some View {
		
		List(datas.users){ user in

			HStack{
				CheckboxView(checked: $datas.checked[user.id-1], id: user.id, duration: user.duration, datas: datas)
					}

					VStack(alignment: .leading) {
						
						Text(user.name)
							.font(.title)
							.fontWeight(.heavy)
							.foregroundColor(Color.gray)
							
						HStack{
							Text(user.duration)
								.font(.title3)
								.foregroundColor(Color.red)
							
//							Text(user.duration)
//								.font(.title3)
//								.foregroundColor(Color.red)
								
							Spacer()
							Text(user.date)
								.font(.title3)
						}
					}
				}
		}

			   }
//}

struct DynoListView_Previews: PreviewProvider {
    static var previews: some View {
        DynoListView()
    }
}
