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
}

#if DEBUG
let testData = [
    Caravan(name: "Adria Compact +", imageName: "AdriaCompactThumb"),
    Caravan(name: "Knaus Sky Traveller", imageName: "KnausSkyTravellerThumb"),
    Caravan(name: "Malibu Van", imageName: "MalibuVanThumb"),
    Caravan(name: "Pössl 2win vario", imageName: "Pössl2winVarioThumb"),
    Caravan(name: "Pössl Road Cruiser", imageName: "PösslRoadCruiserThumb")
]

#endif
