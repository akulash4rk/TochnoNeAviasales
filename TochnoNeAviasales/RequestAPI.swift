//
//  RequestAPI.swift
//  TochnoNeAviasales
//
//  Created by Владислав Баранов on 21.06.2024.
//
import UIKit


func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Неверный URL"])))
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Данные не получены"])))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    task.resume()
}


