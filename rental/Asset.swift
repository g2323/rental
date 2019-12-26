//
//  Caravan.swift
//  rental
//
//  Created by Dr. Nürnberg on 22.12.19.
//  Copyright © 2019 G2323. All rights reserved.
//

import SwiftUI

public struct Asset : Identifiable {
    public var id = UUID()
    public var name: String?
    public var imageName: String?
    public var status: String?
}


//#if DEBUG
//let testData = [
//    Asset(name: "Adria Compact +", imageName: "AdriaCompactThumb", status: "free"),
//    Asset(name: "Knaus Sky Traveller", imageName: "KnausSkyTravellerThumb", status: "free"),
//    Asset(name: "Malibu Van", imageName: "MalibuVanThumb", status: "free"),
//    Asset(name: "Pössl 2win vario", imageName: "Pössl2winVarioThumb", status: "free"),
//    Asset(name: "Pössl Road Cruiser", imageName: "PösslRoadCruiserThumb", status: "free"),
    
//    Asset(name: "e.GO Kart", imageName: "egokartThumb", status: "free"),
//    Asset(name: "e.GO Life", imageName: "egolifeThumb", status: "not available"),
//    Asset(name: "e.GO Mover", imageName: "egomoverThumb", status: "not available")
//]

//#endif
