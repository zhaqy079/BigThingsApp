//
//  MainFeatureController.swift
//  TheBigThing
//
//  Created by zhaqy079.
//

import UIKit
import SwiftUI

class MainFeatureController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // Bridge the SwiftUI to transition to the SubmitController.
    // Action for Submit Button
        @IBAction func submitbtn(_ sender: UIButton) {
    
            let submitView = SubmitController()  // Create the SubmitController SwiftUI view
            let hostingController = UIHostingController(rootView: submitView) // Wrap it in a UIHostingController
            navigationController?.pushViewController(hostingController, animated: true)  // Present the UIHostingController
        }
    
}
    
