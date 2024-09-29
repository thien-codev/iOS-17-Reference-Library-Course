//
//  TestSafariVC.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 29/9/24.
//

import SwiftUI

struct TestSafariVC : View {
    
    private let link = "https://axon.udemy.com/course/swiftui-the-complete-developer-course/learn/lecture/35422466#learning-tools"
    
    @State var presented: Bool = false
    
    
    var body: some View {
        VStack {
            Button {
                presented = true
            } label: {
                Text("Open URL")
            }
        }
        .sheet(isPresented: $presented) {
            SafariViewController(url: URL(string: link)!)
        }
    }
}

#Preview {
    TestSafariVC()
}
