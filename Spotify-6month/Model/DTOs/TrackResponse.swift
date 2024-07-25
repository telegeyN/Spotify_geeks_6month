//
//  TrackResponce.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 25/07/24.
//

import Foundation

struct TracksResponse: Decodable {
    let tracks: [Track]
}

struct Track: Decodable {
    let name: String
    let artists: [Artist]
    let album: Album
}

struct Artist: Decodable {
    let name: String
}

struct Album: Decodable {
    let images: [Image]
}

struct Image: Decodable {
    let url: String
}
