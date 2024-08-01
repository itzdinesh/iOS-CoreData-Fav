//
//  ProductVM.swift
//  TestingProject
//
//  Created by Cynotecck on 17/04/24.
//

import Foundation

@MainActor
class ProductVM : ObservableObject{
   
   @Published var productData : [Product] = []
    init(){
        Task{
            do {
                
                    productData = try await getProduct()
                    print(productData)
                
                 
        
            }
            catch {
                
            }
           
        }
    }
    
    func getProduct() async throws -> [Product]{
        let url = URL(string: "https://fakestoreapi.com/products")
        let request = URLRequest(url: url!)
        let (data, _) = try await URLSession.shared.data(for: request)
            let fetchedData =   try JSONDecoder().decode([Product].self, from: data)
            return fetchedData
    }
    
    
    
    
}
