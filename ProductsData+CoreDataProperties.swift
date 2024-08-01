//
//  ProductsData+CoreDataProperties.swift
//  TestingProject
//
//  Created by cyno on 23/04/24.
//
//

import Foundation
import CoreData


extension ProductsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductsData> {
        return NSFetchRequest<ProductsData>(entityName: "ProductsData")
    }

    @NSManaged public var image: String?
    @NSManaged public var productDescription: String?
    @NSManaged public var productPrice: Double
    @NSManaged public var productTitle: String?
    @NSManaged public var id: Int32

}

extension ProductsData : Identifiable {
    func product (productData : Product){
        image = productData.image
        productDescription = productData.description
        productPrice = productData.price
        productTitle = productData.title
        id = Int32(productData.id)
    }

}
