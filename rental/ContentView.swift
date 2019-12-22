//
//  ContentView.swift
//  rental
//
//  Created by Dr. Nürnberg on 22.12.19.
//  Copyright © 2019 G2323. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var caravans: [Caravan] = []
    
    var body: some View {
        NavigationView {
            List(caravans) { caravan in
                CaravanCell(caravan: caravan)
            }
            .navigationBarTitle(Text("Wohnmobile"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(caravans: testData)
    }
}

struct CaravanCell: View {
    let caravan: Caravan
    var body: some View {
        return NavigationLink(destination: Text(caravan.name)) {
            Image(caravan.imageName)
                .cornerRadius(8)
    
            Text(caravan.name)
        }
    }
}
