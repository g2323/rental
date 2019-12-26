//
//  ContentView.swift
//  rental
//
//  Created by Dr. Nürnberg on 22.12.19.
//  Copyright © 2019 G2323. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = AssetStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addAsset) {
                              Text("Add Asset")
                    }
                }
                
                Section {
                    ForEach(store.assets) { asset in
                        AssetCell(asset: asset)
                    }
                .onDelete(perform: delete)
                .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Wohnmobile"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
             
        }
       
    }
    
    func addAsset() {
        store.insertAsset(name: "e.GO Kart 4", imageName: "egokartThumb", status: "not available")
    }
    
    func delete(at offsets: IndexSet) {
        store.deleteAssets(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int ) {
        store.assets.move(fromOffsets: source, toOffset: destination)
    }
}



struct AssetCell: View {
    let asset: Asset
    var body: some View {
        return NavigationLink(destination: Text(asset.name ?? "")) {
            Image(asset.imageName ?? "")
                .cornerRadius(8)
    
            VStack(alignment: .leading) {
                Text(asset.name ?? "")
                Text(asset.status ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: AssetStore(assets: testData))
            
            ContentView(store: AssetStore(assets: testData))
                .environment(\.colorScheme, .dark)
        }
    }
}
