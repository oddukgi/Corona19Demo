//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Sunmi on 2020/06/04.
//  Copyright © 2020 CreativeSuns. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL       = "https://api.github.com/users/"
    
    //다른 클래스에서 공유하지 않기 위해
    //private 선언
    private init() {}
    
    // return : [Follower]
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
    
        // background thread
        guard let url = URL(string: endpoint) else {
            
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                
                print(error.localizedDescription)
                 completed(.failure(.invalidData))
                //completed(nil,"The data received from the server was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}


