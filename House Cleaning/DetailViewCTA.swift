//
//  DetailViewCTA.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 3/12/22.
//

import SwiftUI

struct DetailViewCTA: View {
    var body: some View {
        
        VStack {
            Text("Not seeing the task you were looking for?")
                .font(.subheadline)
                .padding()
            
            NavigationLink(destination: DetailView()) {
                ZStack {
                    Text("Navigate to the daily view")
                        .foregroundColor(.purple)
                        .underline()
                }
                
                }
            
            }
    }
}



struct DetailViewCTA_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewCTA()
    }
}
