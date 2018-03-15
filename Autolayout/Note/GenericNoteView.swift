//
//  GenericNoteView.swift
//  Autolayout
//
//  Created by Shailesh Aher on 3/14/18.
//  Copyright © 2018 Shailesh Aher. All rights reserved.
//

import UIKit

protocol GenericNoteViewDelegate {
    func showMoreButtonTapped()
}

protocol GenericNoteViewDataSource {
    func getNumberofRows() -> Int
    func getNoteToShow() -> Int
}

class GenericNoteView: UIView {
    
    private let noteLabel : UILabel
    private let showMoreButton : UIButton
    
    var notifier : GenericNoteViewDelegate?
    var noteDataSource : GenericNoteViewDataSource?
    
    //MARK:- Initialization
    override init(frame: CGRect) {
        noteLabel = UILabel(frame: .zero)
        showMoreButton = UIButton(type: .system)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        noteLabel = UILabel(frame: .zero)
        showMoreButton = UIButton(type: .system)
        
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        let LEFT_PADDING : CGFloat = 8
        let TOP_PADDING : CGFloat  = 8
        let RIGHT_PADDING : CGFloat  = -8
        let BOTTOM_PADDING : CGFloat  = 8
        let LABEL_BUTTON_SPACING : CGFloat  = 8
        let BUTTON_HEIGHT : CGFloat  = 24
        let BUTTON_WIDTH : CGFloat  = 100
        
        
        var constraint : NSLayoutConstraint
        
        //Label left
        constraint = NSLayoutConstraint(item: noteLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: LEFT_PADDING)
        addConstraint(constraint)
        
        //Label top
        constraint = NSLayoutConstraint(item: noteLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: TOP_PADDING)
        addConstraint(constraint)
        
        //Label bottom
        constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: noteLabel, attribute: .bottom, multiplier: 1, constant: BOTTOM_PADDING)
        addConstraint(constraint)
        
        //Label right, Button left
        constraint = NSLayoutConstraint(item: showMoreButton, attribute: .leading, relatedBy: .equal, toItem: noteLabel, attribute: .trailing, multiplier: 1, constant: LABEL_BUTTON_SPACING)
        addConstraint(constraint)
        
        //Button top
        constraint = NSLayoutConstraint(item: showMoreButton, attribute: .top, relatedBy: .equal, toItem: noteLabel, attribute: .top, multiplier: 1, constant: 0)
        addConstraint(constraint)
        
        //Button right
        constraint = NSLayoutConstraint(item: showMoreButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: RIGHT_PADDING)
        constraint.priority = .defaultHigh
        addConstraint(constraint)
        
        //Button height
        constraint = NSLayoutConstraint(item: showMoreButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: BUTTON_HEIGHT)
        addConstraint(constraint)
        
        //Button width
        constraint = NSLayoutConstraint(item: showMoreButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: BUTTON_WIDTH)
        addConstraint(constraint)
        
        showMoreButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
    
    @objc private func showMoreTapped() {
        noteLabel.numberOfLines = noteLabel.numberOfLines == 0 ? 1 : 0
        invalidateIntrinsicContentSize()
        notifier?.showMoreButtonTapped()
    }
    
    func addNote(note: String) {
        noteLabel.text = note
        addSubview(noteLabel)
        addSubview(showMoreButton)
        showMoreButton.addTarget(self, action: #selector(showMoreTapped), for: .touchUpInside)
        showMoreButton.setTitle("Show More", for: .normal)
        setNeedsUpdateConstraints()
    }
}
