//
//  CustomToggleStyle.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

struct MyToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "cup.and.saucer.fill" : "cup.and.saucer")
                .resizable()
                .scaledToFit()
                .foregroundColor(configuration.isOn ? .green : .black)
                .frame(height: 30)
                .onTapGesture {
                    configuration.$isOn.wrappedValue.toggle()
                }
        }
    }
}

struct TestCustomToggleStyle: View {
    @State var isToggleOn: Bool = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isToggleOn) {
                Text("Enable")
            }
            .toggleStyle(MyToggle())
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TestCustomToggleStyle()
}

