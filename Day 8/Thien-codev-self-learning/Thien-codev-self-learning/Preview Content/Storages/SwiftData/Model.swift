//
//  Model.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 27/9/24.
//

import SwiftData
import Foundation

@Model
class DataModel: Identifiable {
    var id = UUID()
    var name: String = ""
    var des: String = ""
    
    init(name: String, des: String) {
        self.name = name
        self.des = des
    }
}
