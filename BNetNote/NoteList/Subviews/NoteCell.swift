//
//  NoteCell.swift
//  BNetNote
//
//  Created by Arview on 13.08.2020.
//

import SnapKit
import UIKit

class NoteCell: UITableViewCell {
    
    static let reuseIdentifier = "NoteCell"
    
    private static let dateFormatter = DateFormatter()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    let creationDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let modificationDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.isHidden = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupDateFormatter()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
    
    private func setupViews() {
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(creationDateLabel)
        self.contentView.addSubview(modificationDateLabel)
        
        contentLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalToSuperview().offset(14)
        }
        
        creationDateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(14)
            make.bottom.equalToSuperview().offset(-14).priority(.medium)
            make.leading.equalTo(contentLabel.snp.leading)
        }
        
        modificationDateLabel.snp.makeConstraints { make in
            make.top.equalTo(creationDateLabel.snp.bottom).offset(14)
            make.bottom.equalToSuperview().offset(-14).priority(.high)
            make.leading.equalTo(contentLabel.snp.leading)
        }
    }
    
    func setup(note: Note) {
        self.contentLabel.text = note.content.maxLength(length: 200)
        self.creationDateLabel.text =
            NoteCell.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(Int(note.creationDate) ?? 0)))
        if note.modificationDate != note.creationDate {
            self.modificationDateLabel.text =
                NoteCell.dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(Int(note.modificationDate) ?? 0)))
            self.modificationDateLabel.isHidden = false
        } else {
            modificationDateLabel.removeFromSuperview()
        }
    }
    
    func setupDateFormatter() {
        NoteCell.dateFormatter.dateFormat = "dd-MM-yyyy"
    }
}
