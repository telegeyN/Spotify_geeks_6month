//
//  KeychainService.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 25/07/24.
//

import Foundation
import KeychainSwift

class KeychainService {
    static let shared = KeychainService()
    
    private let keychain = KeychainSwift()
    
    func setAccessToken(token: TokenResponse) {
        
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(token)
            
            keychain.set(data, forKey: "access_token")
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getAccessToken() -> TokenResponse? {
        
        guard let accessToken = keychain.getData("access_token") else {
            return nil
        }
        let decoder = JSONDecoder()
        
        do {
            let data = try decoder.decode(TokenResponse.self, from: accessToken)
            
            return data
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
