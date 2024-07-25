//
//  ErrorRespose.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 25/07/24.
//

import Foundation

struct ErrorResponse: Codable {
    let error: SpotifyError
}

struct SpotifyError: Codable {
    let status: Int
    let message: String
}
