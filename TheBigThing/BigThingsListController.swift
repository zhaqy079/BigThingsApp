//
//  BigThingsListController.swift
//  TheBigThing
//
//  Created by zhaqy079.
//


import UIKit

class BigThingsListController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Listen for updates from SubmitController
               NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name("BigThingsUpdated"), object: nil)
           }

           @objc private func reloadData() {
               collectionView.reloadData()
           }
    
    // Get the count of BigThings from the shared DataManager.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.bigThings.count
    }
    
    // Configure each cell in the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigThingCell", for: indexPath) as! BigThingCell
        cell.imageView.image = DataManager.shared.bigThings[indexPath.row].image // Set the image for the cell
        return cell
    }
    
    // Load the detail page:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? BigThingsDetailsController,
           let indexPath = collectionView.indexPathsForSelectedItems?.first {
            // Pass the selected BigThing to the details controller
            detailsVC.bigThing = DataManager.shared.bigThings[indexPath.row]
        }
    }
    
    
}
