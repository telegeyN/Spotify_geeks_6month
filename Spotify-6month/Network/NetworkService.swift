//
//  NetworkService.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 25/07/24.
//

import Foundation
import UIKit

class NetworkService {
    
    static let shared = NetworkService()
        
        private let keychainService = KeychainService.shared
        
        func getAccessToken(completionHandler: @escaping (TokenResponse?) -> Void) {
            
            let url = URL(string: "https://accounts.spotify.com/api/token")
            
            var request = URLRequest(url: url!)
            
            request.httpMethod = "POST"
            
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            let bodyString = "grant_type=client_credentials&client_id=83f2f0d0e4bf4a3882e97a9f20509c00&client_secret=e0e286e8e9174a3a84ea88192d50c9cf"
            request.httpBody = bodyString.data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print(error!.localizedDescription)
                    completionHandler(nil)
                    return
                }
                
                let decoder = JSONDecoder()
                
                let responseData = try? decoder.decode(TokenResponse.self, from: data)
                
                print(responseData!)
                completionHandler(responseData)
            } .resume()
        }
    
    func getTracks(completion: @escaping ([CategoryItem]?) -> Void) {
            guard let token = keychainService.getAccessToken() else {
                print("Cannot get an access token")
                completion(nil)
                return
            }
            
            let url = URL(string: "https://api.spotify.com/v1/tracks?ids=7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B")
            
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token.access_token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    completion(nil)
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let responseData = try decoder.decode(TracksResponse.self, from: data)
                    let items = responseData.tracks.map { track in
                        CategoryItem(logo: UIImage(data: try! Data(contentsOf: URL(string: track.album.images.first?.url ?? "")!)),
                                     songName: track.name,
                                     artistName: track.artists.first?.name ?? "Unknown")
                    }
                    completion(items)
                } catch {
                    do {
                        let errorResponse = try decoder.decode(ErrorResponse.self, from: data)
                        print(errorResponse.error.message)
                        if errorResponse.error.status == 401 {
                            self.getAccessToken { newTokenResponse in
                                if let newToken = newTokenResponse {
                                    self.keychainService.setAccessToken(token: newToken)
                                    self.getTracks(completion: completion)
                                } else {
                                    print("Failed to refresh token")
                                    completion(nil)
                                }
                            }
                        } else {
                            completion(nil)
                        }
                    } catch {
                        print(error.localizedDescription)
                        completion(nil)
                    }
                }
            }.resume()
        }
    }
