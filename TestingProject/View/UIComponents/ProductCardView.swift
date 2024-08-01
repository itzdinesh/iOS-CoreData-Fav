//
//  ProductCardView.swift
//  TestingProject
//
//  Created by Cynotecck on 17/04/24.
//

import SwiftUI

struct ProductCardView: View {
    var image : String?
    var body: some View {
        
        VStack{
            if let image = image {
                AsyncImage(url: URL(string: image)){ resut in
                    resut
                        .resizable()
                        .frame(width: 150 , height: 200)
                       
                
                        
                }
            placeholder: {
                   ProgressView()
                    .frame(width: 150 , height: 200)
                }
               
                
                    
            }
                
            else{
          
               ProgressView()
                    
            
            }
        }
       
           
         
            .cornerRadius(15)
            .shadow(radius: 15)
        }
    
}

#Preview {
    ProductCardView(image: "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg")
       
      
       
       
}
