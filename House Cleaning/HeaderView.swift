//
//  HeaderView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/12/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
		NavigationView{
			Text("Header text")
				.navigationTitle("CleanWiz")
				.navigationBarTitleDisplayMode(.inline)
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
							  Button(action: {
								print("Settings")
							  }) {
								Label("Send", systemImage: "gearshape.fill")
							  }
							}
				}
		/*Text("Hello, world!")
			.navigationTitle("Title")
			.navigationBarTitleDisplayMode(.inline)*/

		}
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
