//
//  ProductDescriptionCart.swift
//  TestingProject
//
//  Created by Cynotecck on 17/04/24.
//

import SwiftUI

struct ProductDescriptionCart: View {
    @State var productName : String?
    @State var productDescription  : String?
    @State var productRate : String?
    var body: some View {
       
        
        VStack(alignment : .leading , spacing: 10){
            Text(productName ?? "Lorial fgdf  dfdff  dfdv dv  dfgdfgdg  dgdfggdg dgdfgdg dgdfgdgdfgdfgdgd")
                    .font(.title2)
                    .bold()
                    .padding(.top , 40)
            Text("About")
                .font(.title3)
                .fontWeight(.medium)
            Text(productDescription ?? "dfgdgdfgdgdfgdgdgdggdfgdgdfgdgdgdgdgdgdgfdgdfgdgdfgdgdgdgdgdgdgfddgdgdgfggdfgdgdfgdgdgdgdgdgdgfddfgdgdfgdgdgdgdgdgdfgdgdfgdgdgdgdgdgdgfdgdgfdd")
                .font(.system(size: 15))
               Spacer()
            HStack(spacing : -1){
                Button {
                    
                } label: {
                    Text("Buy")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                        .bold()
                        .padding()
                }
                .frame(width: 200 , height: 75)
                .background(.black)
                .cornerRadius(35)
                Rectangle()
                    .frame(width: 15 , height: 25)
               
               Rectangle()
                    .frame(width: 150 , height: 75)
                    .background(.black)
                    .cornerRadius(35)
                    .overlay {
                        HStack{
                            Circle()
                                .frame(width: 50 , height: 50)
                                .foregroundColor(.white)
                                .overlay {
                                    Text("USD")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 15))
                                        .bold()
                                }
                            Text(productRate ?? "74.4343")
                                .foregroundStyle(.white)
                        }
                            
                    }
            }
           
            

            
           
        }
        .padding()
        .frame(maxWidth: .infinity , maxHeight: 400 , alignment: .top)
         .background(RoundedCorners(color:
                                     Color.pitch, tl: 50, tr: 50, bl: 0, br: 0))
    }
}

#Preview {
    ProductDescriptionCart()
}
