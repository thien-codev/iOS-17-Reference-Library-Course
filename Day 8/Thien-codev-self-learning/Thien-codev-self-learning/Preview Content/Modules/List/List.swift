//
//  ListView.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

struct User: Identifiable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
}

class ListViewModel: ObservableObject {
    
    @Published var datas: [User] = [.init(imageName: "img-introduction-1",
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

struct ListView: View {
    
    @StateObject var viewModel = ListViewModel()
    @State var selectedRows: Set<User.ID> = []
    
    var body: some View {
        VStack {
            EditButton()
            List(selection: $selectedRows) {
                ForEach(viewModel.datas, id: \.id) { item in
                    Cell(model: item)
                        .swipeActions {
                            Button {
                                //
                            } label: {
                                Image(systemName: "trash.fill")
                            }

                        }
                }
                .onDelete { idx in
                    viewModel.datas.remove(atOffsets: idx)
                }
                .onMove { source, des in
                    viewModel.datas.move(fromOffsets: source, toOffset: des)
                }
            }
            .listStyle(.plain)
            .refreshable {
                //
            }

        }
    }
}

struct Cell: View {
    let model: User
    
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
    ListView()
}

