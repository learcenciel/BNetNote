//
//  NoteListPresenter.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import Foundation

class NoteListPresenter {
    var view: NoteListViewProtocol
    var router: NoteListRouterProtocol
    
    private let notesAPI: NotesAPI
    
    init(view: NoteListViewProtocol,
         router: NoteListRouterProtocol,
         notesAPI: NotesAPI) {
        self.view = view
        self.router = router
        self.notesAPI = notesAPI
    }
}

extension NoteListPresenter: NoteListPresenterProtocol {
    func viewDidLoad() {
        notesAPI.getUserNotes { result in
            switch result {
            case .failure:
                break
            case .success(let resp):
                let notes = resp.notes[0]
                self.view.showNotes(notes: notes)
            }
        }
    }
    
    func fetchMoreNotes(offset: Int) {
        return
    }
    
    func createNote() {
        return
    }
}
