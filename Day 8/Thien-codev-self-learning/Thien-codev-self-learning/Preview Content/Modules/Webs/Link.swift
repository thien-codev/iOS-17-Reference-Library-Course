//
//  Link.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 29/9/24.
//

import SwiftUI

struct TestLink : View {
    
    private let link = "https://axon.udemy.com/course/swiftui-the-complete-developer-course/learn/lecture/35422466#learning-tools"
    
    
    var body: some View {
        Link(destination: URL(string: link)!) {
            Text("Open Link")
        }
        .allowsHitTesting(false)
    }
}

#Preview {
    TestLink()
}
