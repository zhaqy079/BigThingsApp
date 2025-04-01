//
//  DataManager.swift
//  TheBigThing
//
//  Created by zhaqy079.
//  Reference code: week 13 - Practice answer for cook app part 6 - DataManager

import UIKit
import CoreData


class DataManager: NSObject {
    static let shared = DataManager() // Access this data manager throughout the instance
    
    private var storedBigThings = [BigThing]() // Array to store BigThings
    
    var bigThings: [BigThing] {
        return storedBigThings
    }
    
    override init() {
        super.init()
        refreshBigThings() // Fetch data from the API
    }
    
    // Fetches data from the bigthings URL and populates the storedBigThings array.
    func refreshBigThings() {
        let urlString = "https://www.partiklezoo.com/bigthings/"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data,
                  let jsonArray = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                print("Invalid data or JSON")
                return
            }
            // Loop through each dictionary to extract details.
            for dict in jsonArray {
                // Extract properties from JSON
                let uid = dict["id"] as? String ?? ""
                let name = dict["name"] as? String ?? ""
                let details = dict["description"] as? String ?? ""
                let location = dict["location"] as? String ?? ""
                let year = dict["year"] as? String ?? ""
                let status = dict["status"] as? String ?? ""
                let latitude = dict["latitude"] as? String ?? ""
                let longitude = dict["longitude"] as? String ?? ""
                let rating = dict["rating"] as? String ?? ""
                let votes = dict["votes"] as? String ?? ""
                let imageName = dict["image"] as? String ?? ""
                
                // Construct the image URL
                let imageURLString = "https://www.partiklezoo.com/bigthings/images/" + imageName
                
                // Create a new BigThing object without the image initially
                let newBigThing = BigThing(
                    uid: uid,
                    name: name,
                    details: details,
                    location: location,
                    year: year,
                    status: status,
                    latitude: latitude,
                    longitude: longitude,
                    rating: rating,
                    votes: votes
                )
                
                // Add the BigThing to the list and load its image
                self.addItemToBigThings(newBigThing, imageURL: imageURLString)
            }
            
            // Notify the UI to update after data is fetched
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name("BigThingsUpdated"), object: nil)
            }
        }
        
        task.resume()
    }
    
    func addItemToBigThings(_ newBigThing: BigThing, imageURL: String) {
        // Check if the BigThing already exists
        if !checkForBigThing(newBigThing) {
            // Load the image
            newBigThing.image = loadImage(imageURL)
            
            // Add the BigThing to the list
            storedBigThings.append(newBigThing)
        }
    }
    
    func loadImage(_ imageURL: String) -> UIImage {
        var image: UIImage = UIImage()
        if let url = URL(string: imageURL) {
            if let data = try? Data(contentsOf: url) {
                image = UIImage(data: data) ?? UIImage()
            }
        }
        return image
    }
    
    func checkForBigThing(_ searchItem: BigThing) -> Bool {
        return storedBigThings.contains { $0.uid == searchItem.uid }
    }
    func updateBigThing(at index: Int, with updatedBigThing: BigThing) {
        guard index >= 0 && index < storedBigThings.count else { return }
        storedBigThings[index] = updatedBigThing
    }
}
    // Handle user add new big thing object
    extension DataManager {
        func addNewBigThing(_ bigThing: BigThing) {
            storedBigThings.append(bigThing) // Append the new BigThing
            print("BigThing added: \(bigThing.name)")
        }
    }

