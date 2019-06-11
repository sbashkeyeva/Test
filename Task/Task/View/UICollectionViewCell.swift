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
    
    let textLabel:UILabel={
        let label=UILabel()
        label.font=UIFont.systemFont(ofSize: 17)
        label.text="000007654"
        return label
    }()
    let actualLabel:UILabel={
        let label=UILabel()
        label.text="Актуален"
        label.textColor = .green
        label.font=UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    let dateLabel:UILabel={
        let label=UILabel()
        label.text="09.09.2022"
        label.font=UIFont.systemFont(ofSize: 13)
        return label
    }()
    let currencyLabel:UILabel={
        let label=UILabel()
        label.text="8 100.54 $"
        label.font=UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    let typeCurrencyLabel:UILabel={
        let label=UILabel()
        label.text="USD"
        label.font=UIFont.systemFont(ofSize: 17)
        return label
    }()
    func setupViews(){
        addSubview(textLabel)
        addSubview(actualLabel)
        addSubview(dateLabel)
        addSubview(currencyLabel)
        addSubview(typeCurrencyLabel)
        typeCurrencyLabel.translatesAutoresizingMaskIntoConstraints=false
        currencyLabel.translatesAutoresizingMaskIntoConstraints=false
        dateLabel.translatesAutoresizingMaskIntoConstraints=false
        actualLabel.translatesAutoresizingMaskIntoConstraints=false
        textLabel.translatesAutoresizingMaskIntoConstraints=false
        var constraints=[NSLayoutConstraint]()
        constraints += [
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant:75),
            actualLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            actualLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant:20),
            currencyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            currencyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            typeCurrencyLabel.topAnchor.constraint(equalTo: topAnchor, constant:20),
            typeCurrencyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
        ]
        
        NSLayoutConstraint.activate(constraints)
        backgroundColor = .white
    }
}
