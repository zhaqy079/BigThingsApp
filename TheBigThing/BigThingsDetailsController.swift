//
//  BigThingsDetailsController.swift
//  TheBigThing

// Created by zhaqy079


import UIKit

class BigThingsDetailsController: UIViewController{
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var bigThing: BigThing?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let bigThing = bigThing else { return }
        
        imageView.image = bigThing.image
        nameLabel.text = bigThing.name
        locationLabel.text = bigThing.location
        statusLabel.text = "Status: \(bigThing.status)"
        latitudeLabel.text = "Latitude: \(bigThing.latitude)"
        longitudeLabel.text = "Longitude: \(bigThing.longitude)"
        ratingLabel.text = "Rating: \(bigThing.rating)"
        descriptionTextView.text = bigThing.details
    }
   

   

}
