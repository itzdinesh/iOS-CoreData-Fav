//
//  DetailView.swift
//  TestingProject
//
//  Created by Cynoteck on 17/04/24.
//

import SwiftUI

struct DetailView: View {
    var productData : Product?
    var body: some View {
        ZStack{

           VStack{
               
               if let image = productData?.image ,
                  let productTitle =  productData?.title ,
                  let productDescription = productData?.description ,
                  let productPrice = productData?.price
               {
                   DetailProductCart(image: image) {
                       print("Add to cart")
                   }
                   ProductDescriptionCart(productName: productTitle , productDescription: productDescription , productRate: String(productPrice))
               }
               
              
              
            }
        }
        .ignoresSafeArea()
       
    }
}

#Preview {
    DetailView(productData: Product(id: 4, title: "dsdfds", price: 4.544, description: "dsfsfsfsdf", category: "Fdsfs", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", rating: Rating(rate: 3.45, count: 3)))
}


