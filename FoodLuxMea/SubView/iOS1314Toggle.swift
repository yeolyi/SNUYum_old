//
//  iOS1314Toggle.swift
//  FoodLuxMea
//
//  Created by Seong Yeol Yi on 2020/08/25.
//

import SwiftUI

struct iOS1314Toggle: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isOn: Bool
    let label: String
    let themeColor = ThemeColor()
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Image(systemName: isOn ? "checkmark" : "xmark")
                .offset(x: -5)
                .foregroundColor(themeColor.colorIcon(colorScheme))
        }
    .contentShape(Rectangle())
        .onTapGesture{
            self.isOn.toggle()
        }
    }
}

struct iOS1314Toggle_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            iOS1314Toggle(isOn: .constant(true), label: "test")
                .environmentObject(ThemeColor())
                .modifier(ListRow())
            iOS1314Toggle(isOn: .constant(true), label: "test")
                .environmentObject(ThemeColor())
                .modifier(ListRow())
            HStack {
                Text("Text")
                Spacer()
            }
                .modifier(ListRow())
        }
        
    }
}
