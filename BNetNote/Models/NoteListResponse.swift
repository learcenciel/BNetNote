//
//  Note.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import Foundation

struct NoteListResponse: Codable {
    let status: Int
    let notes: [[Note]]

    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case notes = "data"
    }
}

struct Note: Codable {
    let id: String
    let content: String
    let creationDate: String
    let modificationDate: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case content = "body"
        case creationDate = "da"
        case modificationDate = "dm"
    }
}
