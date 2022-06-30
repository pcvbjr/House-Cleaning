//
//  AccordionView.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 6/12/22.
//

import SwiftUI
import Foundation

struct AccordionView: View {
    @ObservedObject var datas = ReadData()
    @State var overdue = false

    var body: some View {
        var dueTodayArray = buildArray(status: "due: today")
        Text(dueTodayArray[0].status)
    }
}

struct AccordionView_Previews: PreviewProvider {
    static var previews: some View {
        AccordionView()
    }
}
