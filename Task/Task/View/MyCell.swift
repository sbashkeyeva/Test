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
        label.font=UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    let messageLabel:UILabel={
        let label = UILabel()
        label.text="Прием вклада по депозитному договору #098767654. Вкладчик Марченко бла бла бла"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.9
        return label
    }()
    let dateLabel:UILabel = {
        let label=UILabel()
        label.text="09.09.2019"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    let statusLabel:UILabel = {
        let label=UILabel()
        label.text="Входящий"
        label.font=UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    let currencyLabel:UILabel = {
        let label=UILabel()
        label.font=UIFont.boldSystemFont(ofSize: 20)
        label.text="+12.00 $"
        return label
    }()
    func setupViews()
    {
        addSubview(messageLabel)
        addSubview(namelabel)
        addSubview(dateLabel)
        addSubview(statusLabel)
        addSubview(currencyLabel)
        currencyLabel.translatesAutoresizingMaskIntoConstraints=false
        statusLabel.translatesAutoresizingMaskIntoConstraints=false
        dateLabel.translatesAutoresizingMaskIntoConstraints=false
        messageLabel.translatesAutoresizingMaskIntoConstraints=false
        namelabel.translatesAutoresizingMaskIntoConstraints=false
        var constraints=[NSLayoutConstraint]()
        constraints += [
            namelabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            namelabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 20),
            namelabel.topAnchor.constraint(equalTo: topAnchor, constant: 35),
//            namelabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 35),
            namelabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 20),
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor , constant: -10),
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            statusLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            currencyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            currencyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        namelabel.text = "Text"
    }
}
