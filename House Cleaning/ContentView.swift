//
//  ContentView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationView{
			NavigationTabsView()
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
		}
		
	}
		
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environment(\.locale, Locale(identifier: "us"))
    }
}
