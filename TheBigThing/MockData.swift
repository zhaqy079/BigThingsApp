//
//  MockData.swift
//  TheBigThing
//
// Notes: Build a mock test data, (because when i did the api fetch url, its show have 'suspendedpage'
//
import UIKit

// Mock Data for Big Things
struct MockData {
    static let bigThings: [BigThing] = [
        BigThing(
            uid: "1",
            name: "Test Info 1",
            location: "Rundle Mall, Adelaide, South Australia, Australia",
            year: "2024",
            status: "Active",
            latitude: "-34.9236",
            longitude: "138.5999",
            rating: "4.5",
            votes: "25",
            updated: "2024-11-02",
            description: "It's Christmas time for you and I, We'll have a good night and a merry Christmas",
            image: UIImage(named: "Image1") ?? UIImage()
        ),
        BigThing(
            uid: "2",
            name: "Test Info 2",
            location: "King William Street, Adelaide, South Australia, Australia",
            year: "2023",
            status: "Active",
            latitude: "-34.9287",
            longitude: "138.6010",
            rating: "3.8",
            votes: "40",
            updated: "2024-11-02",
            description: "It's Christmas time for you and I, We'll have a good night and a merry Christmas",
            image: UIImage(named: "Image2") ?? UIImage()
        ),
        BigThing(
            uid: "3",
            name: "Test Info 3",
            location: "North Terrace, Adelaide, South Australia, Australia",
            year: "2021",
            status: "Inactive",
            latitude: "-34.9212",
            longitude: "138.6058",
            rating: "4.0",
            votes: "30",
            updated: "2024-11-02",
            description: "It's Christmas time for you and I, We'll have a good night and a merry Christmas",
            image: UIImage(named: "Image3") ?? UIImage()
        ),
        BigThing(
            uid: "4",
            name: "Test Info 4",
            location: "Gouger Street, Adelaide, South Australia, Australia",
            year: "2020",
            status: "Active",
            latitude: "-34.9295",
            longitude: "138.5960",
            rating: "3.0",
            votes: "15",
            updated: "2024-11-02",
            description: "It's Christmas time for you and I, We'll have a good night and a merry Christmas",
            image: UIImage(named: "Image4") ?? UIImage()
        ),
        BigThing(
            uid: "5",
            name: "Test Info 5",
            location: "Hindley Street, Adelaide, South Australia, Australia",
            year: "2019",
            status: "Active",
            latitude: "-34.9238",
            longitude: "138.5943",
            rating: "4.8",
            votes: "15",
            updated: "2024-11-02",
            description: "It's Christmas time for you and I, We'll have a good night and a merry Christmas",
            image: UIImage(named: "Image5") ?? UIImage()
        )
    ]
}
