//
//  Caravan.swift
//  rental
//
//  Created by Dr. Nürnberg on 22.12.19.
//  Copyright © 2019 G2323. All rights reserved.
//

import SwiftUI

struct Caravan : Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var status: String
}

#if DEBUG
let testData = [
    Caravan(name: "Adria Compact +", imageName: "AdriaCompactThumb", status: "free"),
    Caravan(name: "Knaus Sky Traveller", imageName: "KnausSkyTravellerThumb", status: "free"),
    Caravan(name: "Malibu Van", imageName: "MalibuVanThumb", status: "free"),
    Caravan(name: "Pössl 2win vario", imageName: "Pössl2winVarioThumb", status: "free"),
    Caravan(name: "Pössl Road Cruiser", imageName: "PösslRoadCruiserThumb", status: "free"),
    
    Caravan(name: "e.GO Kart", imageName: "egokartThumb", status: "free"),
    Caravan(name: "e.GO Life", imageName: "egolifeThumb", status: "not available"),
    Caravan(name: "e.GO Mover", imageName: "egomoverThumb", status: "not available")
]

#endif
