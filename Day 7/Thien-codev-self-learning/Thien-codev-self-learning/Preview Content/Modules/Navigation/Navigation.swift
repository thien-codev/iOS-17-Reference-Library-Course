//
//  ListView.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 24/9/24.
//

import SwiftUI

struct Navigation: View {
    
    @StateObject var viewModel = ListViewModel()
    @State var selectedRows: Set<User.ID> = []
    
    var body: some View {
        NavigationStack {
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Title")
            .toolbar {
//                Menu {
//                    Button("Option 1", action: {})
//                    Button("Option 2", action: {})
//                    Button("Option 3", action: {})
//                } label: {
//                    Image(systemName: "person.crop.circle.fill")
//                }
                ToolbarItem(id: "settings", placement: .secondaryAction, content: {
                    Button {
                        //
                    } label: {
                        Image(systemName: "person.crop.circle.fill")
                    }

                })
            }
            .toolbarRole(.editor)
        }
    }
}

#Preview {
    Navigation()
}

