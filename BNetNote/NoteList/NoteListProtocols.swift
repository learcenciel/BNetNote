//
//  NoteListProtocols.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import Foundation

protocol NoteListViewProtocol: class {
    var presenter: NoteListPresenterProtocol! { get set }
    
    //MARK:- Presenter -> View
    func showNotes(notes: [Note])
    func showMoreNotes(notes: [Note])
}

protocol NoteListPresenterProtocol: class {
    var view: NoteListViewProtocol { get set }
    var router: NoteListRouterProtocol { get set }
    
    //MARK:- View -> Presenter
    func viewDidLoad()
    func fetchMoreNotes(offset: Int)
    
    //MARK:- Routing
    func createNote()
}

protocol NoteListRouterProtocol: class {
    var view: NoteListViewProtocol { get set }
    //MARK:- Presenter -> Router
    func navigateToNoteCreation()
}
