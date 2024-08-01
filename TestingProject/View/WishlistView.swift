//
//  WishlistView.swift
//  TestingProject
//
//  Created by cyno on 22/04/24.
//

import SwiftUI

struct WishlistView: View {
    @State var favDataArray : [Product] = []
    var body: some View {
        NavigationStack{
        VStack{
         

            List{
                
                ForEach(favDataArray, id: \.id) {  productData in
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

#Preview {
    WishlistView()
}
