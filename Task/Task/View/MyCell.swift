//
//  MyCell.swift
//  Task
//
//  Created by Symbat Bashkeyeva on 6/11/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let namelabel:UILabel = {
        let label = UILabel()
        label.text="Text"
        return label
    }()
    func setupViews(){
        addSubview(namelabel)
        namelabel.translatesAutoresizingMaskIntoConstraints=false
        var constraints=[NSLayoutConstraint]()
        constraints += [
            namelabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            namelabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 20),
            namelabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            namelabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        namelabel.text = "Text"
    }
}
