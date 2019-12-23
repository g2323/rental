//
//  AssetStore.swift
//  rental
//
//  Created by Dr. Nürnberg on 23.12.19.
//  Copyright © 2019 G2323. All rights reserved.
//

import SwiftUI
import Combine

class AssetStore : ObservableObject {
    
    @Published var assets: [Caravan] = []
    
    init(assets: [Caravan] = []) {
        self.assets = assets
    }
    
}
