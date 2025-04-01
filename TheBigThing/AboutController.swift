//
//  AboutController.swift
//  TheBigThing
//
// Created by zhaqy079.
//

import UIKit

class AboutController:
    UIViewController {
    
    @IBOutlet weak var LearnMoreButton: UIButton!
    

    @IBOutlet weak var aboutTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the About content
        // Set the text for the about section
        aboutTextLabel.text = """
        Australia's "Big Things" are large sculptures and architectural landmarks, often found along highways and major roads.
        
        With over 150 structures across every state and territory, these landmarks attract both locals and tourists.
        
        Originally created as roadside attractions, many Big Things are now cult stops for travelers.
        
        Some Big Things are heritage-listed as folk art, though others face risks of demolition...
        """
    }
    // Update Action for the Learn More button to open the wikipedia link
    @IBAction func learnMoreButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://en.wikipedia.org/wiki/Australia%27s_big_things") {
            UIApplication.shared.open(url)
        }
    }
}
    
    

   

