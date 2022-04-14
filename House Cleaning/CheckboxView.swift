//
//  CheckboxView.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 3/12/22.
//
import SwiftUI

struct CheckboxView: View {
	@Binding var checked: Bool
	var id: Int
	var duration: String
	var datas: ReadData

	var body: some View {
		Image(systemName: checked ? "checkmark.square.fill" : "square")
			.foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
			.onTapGesture {
				self.checked.toggle()
				var newDate = dateAdder(duration: duration)
				for var user in datas.users {
					if user.id == id{
						user.date = newDate
						print(user.date)
						print(user)
						// user is updated to new date. Need to write this to json file
						print("checked, initiate write")
						datas.writeData()
					}
				}
			//	var datas = ReadData()
			}
	}
}

struct CheckBoxView_Previews: PreviewProvider {
	struct CheckBoxViewHolder: View {
		@State var checked = false

		var body: some View {
			HStack {

				CheckboxView(checked: $checked, id: 4, duration: "14", datas: ReadData())
			Text("Element that requires checkmark!")
			}
		}
	}

	static var previews: some View {
		Group {
			CheckBoxViewHolder()
			CheckBoxViewHolder()
		}
	}
}
