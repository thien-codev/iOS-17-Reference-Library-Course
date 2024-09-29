//
//  Actors.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

actor ItemData {
    var count = 0
    
    func increase() -> String {
        count += 1
        return "\(count)"
    }
}

struct Test: View {
    
    var itemData: ItemData = .init()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    async let a = itemData.increase()
                    async let b = itemData.increase()
                    
                    print("\(await a) \(await b)")
                }
            } label: {
                Text("Start processing")
            }
            
            Text("Value: \(itemData.count)")
        }
    }
}

#Preview {
    Test()
}

