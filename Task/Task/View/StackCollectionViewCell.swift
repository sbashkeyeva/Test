//
//  StackCollectionViewCell.swift
//  Task
//
//  Created by Symbat Bashkeyeva on 6/13/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class StackCollectionViewCell: UICollectionViewCell {
    let mainStackView = UIStackView()
    let firstStackView = UIStackView()
    let secondStackView = UIStackView()
    let thirdStackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        stylized()
        addSubviews()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let dateLabel=UILabel()
    let numberLabel=UILabel()
    let typeCurrencyLabel = UILabel()
    let actualLabel=UILabel()
    let currencyLabel=UILabel()
    func setupConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints=false
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        typeCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        actualLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        constraints += [
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            firstStackView.heightAnchor.constraint(equalToConstant: 30),
            secondStackView.heightAnchor.constraint(equalToConstant: 30),
            thirdStackView.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    func stylized () {
        dateLabel.text = "12.12.2022"
        dateLabel.textAlignment = .right
        typeCurrencyLabel.text = "USD"
        numberLabel.text = "00002345"
        currencyLabel.text = "8 100.54 $"
        currencyLabel.textAlignment = .right
        actualLabel.text = "Актуален"
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 8
        firstStackView.axis = .horizontal
        firstStackView.distribution = .fillEqually
        firstStackView.alignment = .fill
        secondStackView.axis = .horizontal
        secondStackView.distribution = .fillEqually
        secondStackView.alignment = .fill
        thirdStackView.axis = .horizontal
        thirdStackView.distribution = .fillEqually
        thirdStackView.alignment = .fill
        backgroundColor = .white
    }
    func addSubviews() {
        firstStackView.addArrangedSubview(typeCurrencyLabel)
        firstStackView.addArrangedSubview(dateLabel)
        secondStackView.addArrangedSubview(numberLabel)
        thirdStackView.addArrangedSubview(actualLabel)
        thirdStackView.addArrangedSubview(currencyLabel)
        mainStackView.addArrangedSubview(firstStackView)
        mainStackView.addArrangedSubview(secondStackView)
        mainStackView.addArrangedSubview(thirdStackView)
        contentView.addSubview(mainStackView)
    }
}
