//
//  OverdueListItemView.swift
//  House Cleaning
//
//  Created by Chris Van Buren on 6/5/22.
//

import SwiftUI

struct OverdueListItemView: View {
    @Binding var checked: Bool
    var id: Int
    var duration: String
    var datas: ReadData
    var name: String
    var date: String
    
    var body: some View {
        ZStack{
            Color.red.padding([.leading, .trailing], -20)
            HStack{
                CheckboxView(checked: $checked, id: id, duration: duration, datas: datas)
            //}

                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.gray)
                    HStack{
                        Text(duration)
                            .font(.title3)
                            .foregroundColor(Color.black)
                        Spacer()
                        Text(date)
                            .font(.title3)
                    }
                }
            }
        }
    }
}

/*struct OverdueListItemView_Previews: PreviewProvider {
    static var previews: some View {
        OverdueListItemView(checked: true, id: 2, duration: "12", datas: ReadData, name: <#String#>, date: <#String#>)
    }
}*/
