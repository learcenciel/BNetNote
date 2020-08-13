//
//  NoteCreationResponse.swift
//  BNetNote
//
//  Created by Arview on 13.08.2020.
//

import Foundation

struct NoteCreationResponse: Decodable {
    let status: Int
    let noteCreationData: NoteCreationData
    
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case noteCreationData = "data"
    }
}

struct NoteCreationData: Decodable {
    let id: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
    }
}
