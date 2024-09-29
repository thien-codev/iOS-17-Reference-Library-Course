//
//  SafariViewController.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 29/9/24.
//

import UIKit
import SafariServices
import SwiftUI

struct SafariViewController: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let safari = SFSafariViewController(url: url)
        
        return safari
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
