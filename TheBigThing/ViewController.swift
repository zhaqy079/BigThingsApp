//
//  ViewController.swift
//  TheBigThing Splash page
//
//  Created by zhaqy079.
//  Animation reference : https://github.com/amosgyamfi/open-swiftui-animations

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
   // via storyboard connect to the Explore button
    
    @IBOutlet weak var ExploreButton: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Initialize DataManager
             _ = DataManager.shared
            
            // Embed the SplashAnimationView, contains the animated text and flip button
            let splashAnimationView = SplashAnimationView() // for holds the animated text and the flip button
            let hostingController = UIHostingController(rootView: splashAnimationView)
            
            // Add the hostingController as a child view controller
            addChild(hostingController)
            // Make the SwiftUI view fill the whole screen by matching its frame to the frame
            hostingController.view.frame = self.view.bounds
            hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(hostingController.view) // Add the SwiftUI view
            hostingController.didMove(toParent: self)
        
            // display the Explore button is in front of the animation view
            self.view.bringSubviewToFront(ExploreButton)
        

        }
    
    // Action for Explore button, triggered when the button is tapped
    @IBAction func exploreButtonTapped(_ sender: UIButton) {
        // Perform a segue
        performSegue(withIdentifier: "goToMainFeature", sender: self)
    }
   
    }
  
   
    

