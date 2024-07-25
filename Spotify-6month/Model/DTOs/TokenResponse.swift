//
//  TokenResponse.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 25/07/24.
//

import Foundation

struct TokenResponse: Codable {
    let expires_in: Int
    let token_type: String
    let access_token: String
}
