//
//  PersistanceManager.swift
//  ECSProject
//
//  Created by Fabio Barbato on 25/01/23.
//
import SwiftUI
import CoreData

class PersistanceManager: ObservableObject{
    let container: NSPersistentContainer
    @Published var savedEntities: [OutfitEntity] = []
    
    
    init(){
        container = NSPersistentContainer(name: "ColorDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error{
                print("EEROR LOADING CORE DATA. \(error)")
            }
            else{
                print("Successfully loaded core data!")
            }
        }
        fetchColors()
    }
    
    func fetchColors(){
        let request = NSFetchRequest<OutfitEntity>(entityName: "OutfitEntity")
        
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("Error fetching. \(error)")
        }
    }
    
    func addOutfit(hexShirtIN: String, hexPantsIN: String, hexShoesIN: String){
        let newOutfit = OutfitEntity(context: container.viewContext)
        newOutfit.hexShirt = hexShirtIN
        newOutfit.hexPant = hexPantsIN
        newOutfit.hexShirt = hexShirtIN
        newOutfit.outfitName = "New Outfit"
        saveData()
    }
    
    
    func deleteOutfit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    
    func changeName(indexSet: IndexSet, newName: String){
        guard let index = indexSet.first else { return }
        savedEntities[index].outfitName = newName
        saveData()
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchColors()
        } catch let error{
            print("Error saving. \(error)")
        }
    }
    
    
    
    
}

var vm = PersistanceManager()
