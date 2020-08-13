//
//  SessionCreationResponse.swift
//  BNetNote
//
//  Created by Arview on 13.08.2020.
//

import Foundation

struct SessionCreationResponse: Decodable {
    let status: Int
    let sessionCreationData: SessionCreationData
    
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case sessionCreationData = "data"
    }
}

struct SessionCreationData: Decodable {
    let sessionToken: String
    
    private enum CodingKeys: String, CodingKey {
        case sessionToken = "session"
    }
}
