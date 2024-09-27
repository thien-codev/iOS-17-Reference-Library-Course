//
//  CustomButtonStyle.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

struct UserData: Identifiable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
}

class ScrollViewModel: ObservableObject {
    
    @Published var datas: [UserData] = [.init(imageName: "img-introduction-1",
                                              title: "img-introduction-1"),
                                        .init(imageName: "img-introduction-2",
                                              title: "img-introduction-2"),
                                        .init(imageName: "img-introduction-3",
                                              title: "img-introduction-3"),
                                        .init(imageName: "img-introduction-4",
                                              title: "img-introduction-4"),
                                        .init(imageName: "img-introduction-1",
                                              title: "img-introduction-1"),
                                        .init(imageName: "img-payment-error",
                                              title: "img-payment-error")]
}

struct TestScrollView: View {
    
    @StateObject var viewModel = ScrollViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.datas, id: \.id) { item in
                    CellView(model: item)
                        .containerRelativeFrame(.horizontal)
                        .scrollTransition(axis: .horizontal) { effect, phrase in
                            effect
                                .opacity(phrase.isIdentity ? 1 : 0)
                                .scaleEffect(phrase.isIdentity ? 1 : 0.5)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
    }
}

struct CellView: View {
    let model: UserData
    
    var body: some View {
        VStack {
            Image(model.imageName)
                .resizable()
                .scaledToFit()
            Text(model.title)
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    TestScrollView()
}

