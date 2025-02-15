//
//  CustomButtonStyle.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

@Observable class ViewModel {
    
    init() {
        print("ViewModel Init")
    }
    
    deinit {
        print("ViewModel deinit")
    }
    
    @ObservationIgnored var counter = 0
    
    func increase() {
        counter += 1
    }
}

struct TestView: View {
    
    @State var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.counter)")
            Button("Increase") {
                viewModel.increase()
            }
            TestSubView(viewModel: viewModel)
        }
    }
}

struct TestSubView: View {
    
    var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("\(viewModel.counter)")
            Button("Increase") {
                viewModel.increase()
            }
        }
    }
}

#Preview {
    TestView()
}

