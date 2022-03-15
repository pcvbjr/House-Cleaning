//
//  HomeView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI

struct HomeView: View {
	@State var checked = true

    var body: some View {
		
		VStack {
			Text("HomeView page")
			HStack {
				CheckboxView(checked: $checked)
				Text("Element that requires checkmark!")
					.padding()
			}
		}
		
		
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
