//
//  NoteCellTableViewCell.swift
//  Autolayout
//
//  Created by Shailesh Aher on 3/14/18.
//  Copyright © 2018 Shailesh Aher. All rights reserved.
//

import UIKit

class NoteCellTableViewCell: UITableViewCell {
    
    let noteView: GenericNoteView
    
    var noteActionNotifier : GenericNoteViewDelegate? {
        willSet {
            noteView.notifier = newValue
        }
    }
    var noteDataSource : GenericNoteViewDataSource? {
        willSet {
            noteView.noteDataSource = newValue
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        noteView = GenericNoteView(frame: .zero)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        noteView = GenericNoteView(frame: .zero)
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        noteView.translatesAutoresizingMaskIntoConstraints = false
        
        var vfl = "H:|-0-[noteView]-0-|"
        let dict = ["view" : contentView, "noteView" : noteView]
        var constraints  = NSLayoutConstraint.constraints(withVisualFormat: vfl, options: .alignAllCenterY, metrics: nil, views: dict)
        contentView.addConstraints(constraints)
        
        vfl = "V:|-0-[noteView]-0-|"
        constraints  = NSLayoutConstraint.constraints(withVisualFormat: vfl, options: .alignAllCenterX, metrics: nil, views: dict)
        contentView.addConstraints(constraints)
    }
    
    func addNote(note: String) {
        contentView.addSubview(noteView)
        noteView.addNote(note: note)
    }
}
