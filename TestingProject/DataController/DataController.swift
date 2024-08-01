//
//  DataController.swift
//  TestingProject
//
//  Created by cyno on 23/04/24.
//

import Foundation
import CoreData


class DataController : ObservableObject {
    @Published var products: [ProductsData] = []
    let container = NSPersistentContainer(name: "ProductCoreData")
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error occurred\(error.localizedDescription)")
            }
        }
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
           
            print("Data saved")
        } catch {
            print("Data could not be saved...")
        }
    }
    
    func fetchProducts() {
        let request = NSFetchRequest<ProductsData>(entityName: "ProductsData")
        
        do {
            products = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    /*
     let id: Int
     let title: String
     let price: Double
     let description: String
     let category: String
     let image: String
     */
    func addProducts(id : String ,title : String , price : Double , description : String , category : String , image : String ,context: NSManagedObjectContext) {
        let product = ProductsData(context: context)
        product.id = Int32(id) ?? 1
        product.image = image
        product.productPrice = price
        product.productTitle = title
        product.productDescription = description
        save(context: context)
    }
    
}
