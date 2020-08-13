//
//  NoteListDIPart.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import DITranquillity
import UIKit

class TopGamesDIPart: DIPart {
    static func load(container: DIContainer) {
        container.register { NoteListViewController() }
            .as(NoteListViewProtocol.self)
            .injection(cycle: true, \.presenter)
            .lifetime(.objectGraph)
        
        container.register(NoteListPresenter.init)
            .as(NoteListPresenterProtocol.self)
            .lifetime(.objectGraph)
        
        container.register(NoteListRouter.init)
            .as(NoteListRouterProtocol.self)
            .lifetime(.objectGraph)
        
        container.register(NotesAPI.init)
            .lifetime(.objectGraph)
        
        container.register(HTTPClient.init)
            .lifetime(.objectGraph)
    }
}
