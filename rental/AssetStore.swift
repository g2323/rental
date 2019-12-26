//
//  AssetStore.swift
//  rental
//
//  Created by Dr. Nürnberg on 23.12.19.
//  Copyright © 2019 G2323. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

class AssetStore : ObservableObject {
    
    //globaler Assetstore
    //class var sharedInstance: AssetStore {
    //    struct Static {
    //        static let sharedIstance: AssetStore = AssetStore()
    //    }
    //    return Static.sharedIstance
    //}
    
    //class var sharedInstance: AssetStore {
    //    struct Singleton {
    //        static let instance = AssetStore()
    //    }
    //    return Singleton.instance
    //}
    
    
    @Published var assets: [Asset] = []
    var assetEntities: [AssetDO] = []
      
    //let persistentContainer = NSPersistentContainer(name: "iCloud.org.g2323.rental")
    var contextRef : NSManagedObjectContext? = nil
    
    init() {
        readAssets()
    }
    
    init(assets: [Asset] = []) {
        self.assets = assets
        //initializeStack()
    }
    
    func context() -> NSManagedObjectContext {
        if (self.contextRef == nil) {
            initializeStack()
        }
        return self.contextRef!
    }
    
    func initializeStack() {
        print("AssetStore.initializeStack()")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.contextRef = appDelegate.persistentContainer.newBackgroundContext()
        appDelegate.persistentContainer.loadPersistentStores { (description, error) in
            print("loadPersistentStores:")
            print(description)
            print(error ?? "ok")
        }
    }
    
    func readAssets() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Asset")
        
        do {
            self.assetEntities = try context().fetch(fetchRequest) as! [AssetDO]
            
            self.assets.removeAll()
            for asset in self.assetEntities {
                self.assets.append(Asset(name: asset.name, imageName: asset.imageName, status: asset.status))
            }
        } catch let error as NSError {
            print("error: \(error)")
        }
    }
    
    func insertAsset(name: String, imageName: String, status: String) {
        //Presentation Model
        assets.append(Asset(name: name, imageName: imageName, status: status))
               
        //Persistence Model
        let assetEntity = NSEntityDescription.insertNewObject(forEntityName: "Asset", into: context()) as! AssetDO
        assetEntity.name = name
        assetEntity.imageName = imageName
        assetEntity.status = status
        
        self.assetEntities.append(assetEntity)
        
        do {
            try context().save()
        }
        catch let error as NSError {
            fatalError("error: \(error)")
        }
    }
    
    func deleteAssets(atOffsets: IndexSet) {
        for index in atOffsets {
            //let asset = self.assets[index]
            //erstmal gruselig
            let assetEntity = self.assetEntities[index]
            context().delete(assetEntity)
            
        }
        self.assets.remove(atOffsets: atOffsets)
        self.assetEntities.remove(atOffsets: atOffsets)
        
        do {
            try context().save()
        }
        catch let error as NSError {
            fatalError("error: \(error)")
        }
    }
    
    func move(from source: IndexSet, to destination: Int ) {
        self.assets.move(fromOffsets: source, toOffset: destination)
        self.assetEntities.move(fromOffsets: source, toOffset: destination)
    }
    
}

#if DEBUG
let testData = [
    Asset(name: "Adria Compact +", imageName: "AdriaCompactThumb", status: "free"),
    Asset(name: "Knaus Sky Traveller", imageName: "KnausSkyTravellerThumb", status: "free"),
    Asset(name: "Malibu Van", imageName: "MalibuVanThumb", status: "free"),
    Asset(name: "Pössl 2win vario", imageName: "Pössl2winVarioThumb", status: "free"),
    Asset(name: "Pössl Road Cruiser", imageName: "PösslRoadCruiserThumb", status: "free"),
    
    Asset(name: "e.GO Kart", imageName: "egokartThumb", status: "free"),
    Asset(name: "e.GO Life", imageName: "egolifeThumb", status: "not available"),
    Asset(name: "e.GO Mover", imageName: "egomoverThumb", status: "not available")
]

#endif


    //@FetchRequest(fetchRequest: Asset.allAssetsFetchRequest()) var assets: FetchedResults<Asset>
