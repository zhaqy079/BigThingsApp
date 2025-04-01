//
//  BigThing.swift
//  TheBigThing
//
//  Created by zhaqy079.
//  Reference code: week 13 - Practice answer for cook app part 6 - DataManager

import UIKit

class BigThing: NSObject {
    // Private properties for internal storage
    private var storedImage: UIImage = UIImage()
    private var storedName: String = ""
    private var storedDetails: String = ""
    private var storedUID: String = ""
    private var storedLocation: String = ""
    private var storedYear: String = ""
    private var storedStatus: String = ""
    private var storedLatitude: String = ""
    private var storedLongitude: String = ""
    private var storedRating: String = ""
    private var storedVotes: String = ""

    // Public computed properties
    var image: UIImage {
        get { return storedImage }
        set { storedImage = newValue }
    }
    
    var uid: String {
        return storedUID
    }
    
    var name: String {
        return storedName
    }
    
    var details: String {
        return storedDetails
    }
    
    var location: String {
        return storedLocation
    }
    
    var year: String {
        return storedYear
    }
    
    var status: String {
        return storedStatus
    }
    
    var latitude: String {
        return storedLatitude
    }
    
    var longitude: String {
        return storedLongitude
    }
    
    var rating: String {
        return storedRating
    }
    
    var votes: String {
        return storedVotes
    }

    // Initializer with image
    init(uid: String, name: String, details: String, location: String, year: String, status: String, latitude: String, longitude: String, rating: String, votes: String, photo image: UIImage) {
        super.init()
        storedUID = uid
        storedName = name
        storedDetails = details
        storedLocation = location
        storedYear = year
        storedStatus = status
        storedLatitude = latitude
        storedLongitude = longitude
        storedRating = rating
        storedVotes = votes
        storedImage = image
    }

    // Initializer without image
    init(uid: String, name: String, details: String, location: String, year: String, status: String, latitude: String, longitude: String, rating: String, votes: String) {
        super.init()
        storedUID = uid
        storedName = name
        storedDetails = details
        storedLocation = location
        storedYear = year
        storedStatus = status
        storedLatitude = latitude
        storedLongitude = longitude
        storedRating = rating
        storedVotes = votes
    }
}
