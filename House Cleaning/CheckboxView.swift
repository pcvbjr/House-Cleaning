//
//  CheckboxView.swift
//  House Cleaning
//
//  Created by Kaitlyn McCarthy on 3/12/22.
//
import SwiftUI

struct CheckboxView: View {
	@Binding var checked: Bool

	var body: some View {
		Image(systemName: checked ? "checkmark.square.fill" : "square")
			.foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
			.onTapGesture {
				self.checked.toggle()
			}
	}
}

struct CheckBoxView_Previews: PreviewProvider {
	struct CheckBoxViewHolder: View {
		@State var checked = false

		var body: some View {
			HStack {

				CheckboxView(checked: $checked)
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
