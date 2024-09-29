//
//  UserPreference.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 27/9/24.
//

import SwiftUI

struct AppStorageTest: View {
    
    @AppStorage("counter") var myCounter: Int = 0
    
    var body: some View {
        HStack {
            Stepper("", value: $myCounter)
                .labelsHidden()
            Text("\(myCounter)")
        }
    }
}

#Preview {
    AppStorageTest()
}
                 
                 
                 
