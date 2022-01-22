//
//  PlacesModel.swift
//  MyPlaces
//
//  Created by Ruslan Bihun on 20.01.2022.
//

import UIKit

struct Place {
    var placeImage: String?
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    
    static let nameRestorants = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        for place in nameRestorants {
            places.append(Place(placeImage: place, name: place, location: "Киев", type: "Ресторан", image: nil))
        }
        
        return places
    }
}
