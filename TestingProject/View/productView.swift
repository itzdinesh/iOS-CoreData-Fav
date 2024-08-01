//
//  productView.swift
//  TestingProject
//
//  Created by Cynotecck on 17/04/24.
//

import SwiftUI

struct productView: View {
    @State private var favoriteTapped: [Int : Bool] = [:]
   @StateObject var ViewModel : ProductVM = ProductVM()
    @State var favModelArray : [Product] = []
    var body: some View {
        NavigationStack{
        VStack{
       
          
            NavigationLink(destination: {
                WishlistView(favDataArray: favModelArray)
            }, label: {
                Text("See your wishlist :)")
            })
            .frame(maxWidth: .infinity , alignment: .trailing)
            .padding()

            List{
                
                ForEach(Array(ViewModel.productData.enumerated()), id: \.1.id) { index, productData in
                        HStack{
                            ProductCardView(image: productData.image)
                                .padding()
                            VStack(alignment: .leading, spacing : 10){
                                Text(productData.title)
                                    .font(.title3)
                                    .bold()
                                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                
                                Text(productData.description)
                                    .font(.subheadline)
                                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                
                                Text(String("\(productData.price)$"))
                                    .foregroundStyle(.blue)
                             
                                Image(favoriteTapped[productData.id, default: false] ? "fill" : "unfill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30 , height: 30)
                                        .onTapGesture {
                                            favoriteTapped[productData.id, default: false].toggle()
                                            if favoriteTapped[productData.id] == true{
                                                saveProduct(id: productData.id, title: productData.title, price: productData.price, descri: productData.description, cat: productData.category, img: productData.image, rate: Rating(rate: 4.4, count: 2))
                                                print(favModelArray.map { $0.id })
                                            }
                                            
                                            else{
                                                favModelArray.removeAll { product in
                                                    product.id == productData.id
                                                }
                                                print(favModelArray.map { $0.id })
                                                
                                            }
                             
                                        }

                            }
                            .frame(width : 100)
                            NavigationLink("", destination: DetailView(productData: productData)
                            )
                        }
                    }
                }
            }
            
               
            
           
        }
    }
    func saveProduct(id : Int , title : String , price : Double , descri : String , cat : String , img : String , rate : Rating){
        favModelArray.append(Product(id: id, title: title, price: price, description: descri, category: cat, image: img, rating: rate ))
        print(favModelArray.map { $0.title })
    }
}

#Preview {
    productView()
}


enum Products : String, CaseIterable {
   
    
    case Tshirt
    case Shirt
    
    
}


/*
 struct productView: View {
     @State private var favoriteTapped: [Int : Bool] = [:]
    @StateObject var ViewModel : ProductVM = ProductVM()
     var body: some View {
         NavigationStack{
         VStack{
             Button {
                 print("View Wishlist called")
             } label: {
                 Text("View your wishlist")
                     .foregroundStyle(.black)
             }
             .frame(maxWidth: .infinity , alignment: .trailing)
             .padding()

             List{
                 
                 ForEach(Array(ViewModel.productData.enumerated()), id: \.1.id) { index, productData in
                         HStack{
                             ProductCardView(image: productData.image)
                                 .padding()
                             VStack(alignment: .leading, spacing : 10){
                                 Text(productData.title)
                                     .font(.title3)
                                     .bold()
                                     .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                 
                                 Text(productData.description)
                                     .font(.subheadline)
                                     .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                 
                                 Text(String("\(productData.price)$"))
                                     .foregroundStyle(.blue)

                                 Image(favoriteTapped[productData.id, default: false] ? "fill" : "unfill")
                                         .resizable()
                                         .scaledToFit()
                                         .frame(width: 30 , height: 30)
                                         .onTapGesture {
                                             favoriteTapped[productData.id, default: false].toggle()
                                             print("fav Button tapped\(index)")
                                         }

                             }
                             .frame(width : 100)
                             NavigationLink("", destination: DetailView(productData: productData)
                             )
                         }
                     }
                 }
             }
             
                
             
            
         }
     }
 }

 */
