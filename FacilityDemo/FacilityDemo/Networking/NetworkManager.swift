//
//  NetworkManager.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 28/06/23.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkManager {
    func getApiData<T: Decodable>(requestUrl: URL, resultType: T.Type, completion: @escaping (Result<T>) -> Void) {
        URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NetworkError.unknownError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch (let error1){
                completion(.failure(error1))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case unknownError
}
