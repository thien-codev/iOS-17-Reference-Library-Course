//
//  CustomButtonStyle.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

struct MyButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
    }
}

struct TestCustomButtonStyle: View {
    
    var body: some View {
        Button {
            //
        } label: {
            Text("Button")
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2))
        }
        .buttonStyle(MyButton())

    }
}

#Preview {
    TestCustomButtonStyle()
}

