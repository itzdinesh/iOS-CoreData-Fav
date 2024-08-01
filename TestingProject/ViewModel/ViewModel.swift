//
//  ViewModel.swift
//  TestingProject
//
//  Created by Cynotecck on 16/04/24.
//

import Foundation

struct Product: Codable , Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}



class Lullu {
    init (){
       
    }
    func fetchMyModel(completion: @escaping (Result<[Product], Error>) -> Void) {
       
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        var request = URLRequest(url: url)
      
      
        let session = URLSession.shared
        
    
        let task = session.dataTask(with: request) { data, response, error in
          
            if let error = error {
                completion(.failure(error))
                return
            }
            
           
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
              
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let myModel = try decoder.decode([Product].self, from: data)
                print(myModel)
              
                completion(.success(myModel))
            } catch {
              
                completion(.failure(error))
            }
        }
        
      
        task.resume()
    }
    
    
    func login() {
        let urlString = "https://stageapi.thegotworkapp.com/api/token/generate"
        guard let url = URL(string: urlString) else { return }
        
        let parameters = [
            "email": "contractor@gmail.com",
            "password": "123456",
            "latitude": 37.785834,
            "longitude": -122.406417,
            "location": "",
            "device_id": "7BC6DC97-A683-46D1-B0E4-28B570BDAA01",
            "device_token": "cP_UdfveqkFhlKfBNZNIfj:APA91bFUMOjsnHy1i_jrqhPMX8EuQQ1WTsPybht5WGC6_RUpRCBYOUTC8o1JFqnjLOFzUtsSp2yD2idz52a6JSIBIV2UXX3BuUSLYLOnTN3000WYzvfzGmKQco27SoQcWJdZVHbpHI9l",
            "device_type": "Ios"
        ] as [String : Any]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let loginResponse = try decoder.decode(LoginResponse.self, from: data)
                print(loginResponse)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }

}


struct LoginResponse: Codable {
    let success: Bool
    let data: Data
    let status: Int
    let message: String
}

struct Data: Codable {
    let token: String
    let user_type: Int
    let isProfileUpdated: Int
    let user_id: Int
}


