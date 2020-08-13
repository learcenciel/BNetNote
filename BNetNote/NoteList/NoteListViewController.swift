//
//  ViewController.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import SnapKit
import UIKit

class NoteListViewController: UIViewController {
    var presenter: NoteListPresenterProtocol!
    
    var notes: [Note] = []
    
    private let noteListTableView: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        setupTableView()
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        view.addSubview(noteListTableView)
        
        noteListTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        noteListTableView.backgroundColor = .white
        noteListTableView.dataSource = self
        noteListTableView.delegate = self
        noteListTableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reuseIdentifier)
        noteListTableView.separatorStyle = .singleLine
        noteListTableView.rowHeight = UITableView.automaticDimension
        noteListTableView.estimatedRowHeight = 140
    }
}

extension NoteListViewController: NoteListViewProtocol {
    func showNotes(notes: [Note]) {
        self.notes = notes
        self.noteListTableView.reloadData()
    }
    
    func showMoreNotes(notes: [Note]) {
        self.notes.append(contentsOf: notes)
        self.noteListTableView.reloadData()
    }
}

extension NoteListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseIdentifier, for: indexPath) as! NoteCell
        cell.setup(note: notes[indexPath.row])
        return cell
    }
}

extension NoteListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(notes[indexPath.row])
    }
}
