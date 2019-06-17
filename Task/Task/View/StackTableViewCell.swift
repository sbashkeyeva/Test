//
//  StackTableViewCell.swift
//  Task
//
//  Created by Symbat Bashkeyeva on 6/13/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class StackTableViewCell: UITableViewCell {
    let mainStackView = UIStackView()
    let firstStackView = UIStackView()
    let secondStackView = UIStackView()
    let thirdStackView = UIStackView()
    let fourthStackView = UIStackView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stylized()
        setupConstraints()
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let dateLabel = UILabel()
    let messageLabel = UILabel()
    let nameLabel = UILabel()
    let statusLabel = UILabel()
    let currencyLabel = UILabel()
    func stylized() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 8
        firstStackView.axis = .horizontal
        firstStackView.alignment = .fill
        firstStackView.distribution = .fillProportionally
        firstStackView.spacing = 8
        secondStackView.axis = .horizontal
        secondStackView.alignment = .fill
        secondStackView.distribution = .fillEqually
        secondStackView.spacing = 8
        thirdStackView.axis = .horizontal
        thirdStackView.alignment = .fill
        thirdStackView.distribution = .equalSpacing
        thirdStackView.spacing = 8
        fourthStackView.axis = .horizontal
        fourthStackView.alignment = .fill
        fourthStackView.distribution = .fillEqually
        fourthStackView.spacing = 8
        dateLabel.text = "03.03.2019"
        dateLabel.textAlignment = .right
        messageLabel.text = """
        Прием вклада по депозитному договору #098767654. Вкладчик Марченко бла бла бла
        """
        messageLabel.numberOfLines = 0
        statusLabel.text = "Входящий"
        currencyLabel.text = "+12.00 $"
        currencyLabel.textAlignment = .right
    }
    func setupConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        fourthStackView.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        constraints += [
            mainStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    func setupSubviews() {
        firstStackView.addArrangedSubview(dateLabel)
        secondStackView.addArrangedSubview(messageLabel)
        thirdStackView.addArrangedSubview(nameLabel)
        fourthStackView.addArrangedSubview(statusLabel)
        fourthStackView.addArrangedSubview(currencyLabel)
        mainStackView.addArrangedSubview(firstStackView)
        mainStackView.addArrangedSubview(secondStackView)
        mainStackView.addArrangedSubview(thirdStackView)
        mainStackView.addArrangedSubview(fourthStackView)
        contentView.addSubview(mainStackView)
    }
}
