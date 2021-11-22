//
//  PhotoApi.swift
//  Lesson1
//
//  Created by Павел Заруцков on 22.11.2021.
//

import SwiftUI
import Alamofire

protocol PhotoService {
    func get (_ completion: @escaping (Photos?) -> ())
}

class PhotoAPI: PhotoService {
    @ObservedObject var session = Session.instance
    
    let baseUrl = "https://api.vk.com/method"
    let method = "/photos.getAll"
    var params: Parameters = [:]
    
    func get(_ completion: @escaping (Photos?) -> ()) {
        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "count": 200,
            "v": session.version,
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            
            guard let data = response.data else { return }
            
            do {
                var photos: Photos
                photos = try JSONDecoder().decode(Photos.self, from: data)
                completion(photos)
            } catch {
                print(error)
            }
        }
    }
}
