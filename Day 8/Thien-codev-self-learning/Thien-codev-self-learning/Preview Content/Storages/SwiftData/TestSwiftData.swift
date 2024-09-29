//
//  TestSwiftData.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 27/9/24.
//

import SwiftUI
import SwiftData

struct TestSwiftData: View {
    
    @Environment(\.modelContext) var dbContext
    @Query var models: [DataModel]
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
