//
//  CustomLayout.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

struct TestCustomLayout: View {
    var body: some View {
        CustomLayout {
            Group {
                Text("View 1")
                Text("View 2")
                Text("View 3")
            }
        }
    }
}

#Preview {
    TestCustomLayout()
}

struct CustomLayout: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let startX = bounds.minX
        let startY = bounds.minY
        
        for (index, view) in subviews.enumerated() {
            // Calculate position based on index
            let position = CGPoint(x: startX + CGFloat(index) * 10, y: startY + CGFloat(index) * 10)
            // Place the view
            view.place(at: position, proposal: .unspecified)
        }
    }
}
