//
//  ViewController.swift
//  Task
//
//  Created by Symbat Bashkeyeva on 6/8/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UICollectionViewCell: ReusableView {
}

extension UITableViewCell : ReusableView {
    
}

class VC: UIViewController {
    let tableView = UITableView()
    let names = ["Bil Gates","Steve Jobs","Mark Zucherberg","Test","Zhizn'","klass"] +
    ["Bil Gates","Steve Jobs","Mark Zucherberg","Test","Zhizn'","klass"] +
    ["Bil Gates","Steve Jobs","Mark Zucherberg","Test","Zhizn'","klass"] + ["Bil Gates","Steve Jobs","Mark Zucherberg","Test","Zhizn'","klass"]
    let cellIdentifier="cellIdentifier"
    let bullet="bullet"
    let stackCell="stackCell"
    let stackTableCell = "stackTableCell"
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        addSubviews()
        addConstraints()
        stylized()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StackCollectionViewCell.self)
//        collectionView.register(Bullet.self, forCellWithReuseIdentifier: bullet)
//        collectionView.register(StackCollectionViewCell.self, forCellWithReuseIdentifier: stackCell)
    }
    func addSubviews() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(MyCell.self, forCellReuseIdentifier: cellIdentifier)
//        tableView.register(StackTableViewCell.self, forCellReuseIdentifier: stackTableCell)
        
        tableView.tableHeaderView = tableHeaderView
        tableView.tableHeaderView?.addSubview(collectionView)
        tableView.register(StackTableViewCell.self)
    }
    func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        tableView.translatesAutoresizingMaskIntoConstraints=false
        constraints += [
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]

        collectionView.translatesAutoresizingMaskIntoConstraints=false
        constraints += [
            collectionView.topAnchor.constraint(equalTo: tableHeaderView.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: tableHeaderView.bottomAnchor, constant: -10),
            collectionView.leftAnchor.constraint(equalTo: tableHeaderView.leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: tableHeaderView.rightAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    func stylized() {
        let flowLayout=UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width-20, height: 152)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        collectionView.collectionViewLayout=flowLayout
        collectionView.backgroundColor = .green
        collectionView.isPagingEnabled = true
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 150
        tableView.estimatedRowHeight = 100
    }
}

extension VC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyCell else {
//            return UITableViewCell()
//        }
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: stackTableCell, for: indexPath)
//            as? StackTableViewCell else {
//            return UITableViewCell()
//        }
        let cell : StackTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath)
        if indexPath.row < 6 {
            cell.nameLabel.text=names[indexPath.item]
        }
        return cell
    }
}

extension VC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : StackCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath as NSIndexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: NSIndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier,
                                             for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}

extension UITableView {
    func register<T: UITableViewCell>(_ : T.Type) where T: ReusableView  {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: NSIndexPath)-> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier,
                                             for: indexPath as IndexPath) as? T else{
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}















