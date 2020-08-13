//
//  NoteListRouter.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import DITranquillity
import Foundation

class NoteListRouter {
    
    var view: NoteListViewProtocol
    
    init(view: NoteListViewProtocol) {
        self.view = view
    }
}

extension NoteListRouter: NoteListRouterProtocol {
    func navigateToNoteCreation() {
        return
    }
}
