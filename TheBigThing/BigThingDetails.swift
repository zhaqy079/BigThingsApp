//
//  BigThingDetails.swift
//  TheBigThing
//
//  Created by 福娃 on 17/11/2024.
//

import UIKit

class BigThingDetailsController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    var bigThingIndex: Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if bigThingIndex >= 0 {
            let bigThing = DataManager.shared.bigThings[bigThingIndex]
            
            imageView.image = bigThing.image
            nameLabel.text = bigThing.name
            locationLabel.text = "Location: \(bigThing.location)"
            yearLabel.text = "Year: \(bigThing.year)"
            statusLabel.text = "Status: \(bigThing.status)"
            latitudeLabel.text = "Latitude: \(bigThing.latitude)"
            longitudeLabel.text = "Longitude: \(bigThing.longitude)"
            ratingLabel.text = "Rating: \(bigThing.rating) (\(bigThing.votes) votes)"
            descriptionTextView.text = bigThing.descriptionInfo
        }
    }
}


