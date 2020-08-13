//
//  NotesAPI.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import Foundation

class NotesAPI {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func startNewSession(parameters: [String: Any]?,
                         completionHandler: @escaping(Result<SessionCreationResponse, HTTPErrors>) -> Void) {
        httpClient.post(url: "https://bnet.i-partner.ru/testAPI/",
                        headers: ["token": "bfQoWBv-EW-s2ehgaN"],
                        parameters: ["a": "new_session"],
                        completionHandler: completionHandler)
    }
    
    func getUserNotes(completionHandler: @escaping(Result<NoteListResponse, HTTPErrors>) -> Void) {
        httpClient.post(url: "https://bnet.i-partner.ru/testAPI/",
                        headers: ["token": "bfQoWBv-EW-s2ehgaN"],
                        parameters: ["a": "get_entries",
                                     "session": UserDefaults.standard.string(forKey: UserDefaultsKeys.sessionToken) ?? ""],
                        completionHandler: completionHandler)
    }
    
    func createNewUserNote(body: String, completionHandler: @escaping(Result<NoteCreationResponse, HTTPErrors>) -> Void) {
        httpClient.post(url: "https://bnet.i-partner.ru/testAPI/",
                        headers: ["token": "bfQoWBv-EW-s2ehgaN"],
                        parameters: ["a": "add_entry",
                                     "session": UserDefaults.standard.string(forKey: UserDefaultsKeys.sessionToken) ?? ""],
                        completionHandler: completionHandler)
    }
}
