//
//  ContentView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 3/8/22.
//

import SwiftUI


struct ContentView: View {
    // set the t/f value of your CheckboxView view
    @State var checked = true
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
                
                // tasks dynamically populate within frame here
                
                HStack {
                    CheckboxView(checked: $checked)
                    Text("Element that requires checkmark!")
                }
                .padding()
                Divider()
                .padding()
                DetailViewCTA()
                
                
                Spacer()
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
