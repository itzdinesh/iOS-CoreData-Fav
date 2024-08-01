//
//  DetailProductCart.swift
//  TestingProject
//
//  Created by Cynotecck on 17/04/24.
//

import SwiftUI

struct DetailProductCart: View {
    var image : String?
    typealias Action = () -> ()
    var addCartAction : Action?
    var body: some View {
        VStack{
                Button(action: {
                    (addCartAction ?? {})()
                }, label: {
                    HStack{
                        Text("Add to wishlist")
                            .foregroundStyle(.black)
                        Image("Cart")
                           
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20 , height: 20)
                    }
                    .padding()
                })
                .frame(maxWidth: .infinity , maxHeight: 20, alignment: .trailing)
            Spacer()
            if let image = image {
                AsyncImage(url: URL(string: image)){ result in
                    result
                        .resizable()
                        .scaledToFit()
                        
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width - 20 , height: 350)
                }
                
                 
                    
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20 , height: 350)
       
      
       
              
      
    }
}

#Preview {
    DetailProductCart(image: "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg")
}

struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height

                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}
