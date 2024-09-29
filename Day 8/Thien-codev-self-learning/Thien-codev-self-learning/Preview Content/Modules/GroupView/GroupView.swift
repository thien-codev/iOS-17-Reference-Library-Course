//
//  GroupView.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

struct GroupView: View {
    @State var isToggleOn: Bool = false
    
    var body: some View {
        GroupBox("Setting") {
            VStack {
                Toggle(isOn: $isToggleOn) {
                    Text("Enable")
                }
                .toggleStyle(MyToggle())
                
            }
        }
        .padding()
    }
}

#Preview {
    GroupView()
}

