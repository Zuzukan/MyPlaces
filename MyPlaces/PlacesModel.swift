//
//  PlacesModel.swift
//  MyPlaces
//
//  Created by Ruslan Bihun on 20.01.2022.
//

import Foundation

struct Place {
    var image: String
    var name: String
    var location: String
    var type: String
    
    static let nameRestorant = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        for place in nameRestorant {
            places.append(Place(image: place, name: place, location: "Киев", type: "Ресторан"))
        }
        
        return places
    }
}
