//
//  File.swift
//  Task
//
//  Created by Symbat Bashkeyeva on 6/11/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class Bullet:UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textLabel = UILabel()
    
    func setupViews(){
        addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints=false
        var constraints=[NSLayoutConstraint]()
        constraints += [
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        backgroundColor = .white
    }
}
