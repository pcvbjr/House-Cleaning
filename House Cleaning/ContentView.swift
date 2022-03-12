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
			VStack(alignment: .center) {
				Text("CleanWiz")
					.fontWeight(.light)
					.padding()
					.font(.title3)
					.foregroundColor(.blue)
				Text("Hi, neat freak.")
					.fontWeight(.bold)
					.padding()
					.font(.title)
					.frame(width: 400, height: 100, alignment: .leading)
				Text(Date(), style: .date)
					.font(.title3)
					.padding()
					.frame(width: 400, height: 100, alignment: .leading)
				Text("Today's Tasks")
					.font(.headline)
					.padding()
					.frame(width: 400, height: 80, alignment: .leading)
				NavigationLink(destination: SampleView()) { Text("click here") }
				
				
				Spacer()
			}
		}
		
    }
}

struct SampleView: View{
	var body: some View{
		Text("made it to this page")
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environment(\.locale, Locale(identifier: "us"))
    }
}
