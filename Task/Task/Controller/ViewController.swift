//
//  ViewController.swift
//  Task
//
//  Created by Symbat Bashkeyeva on 6/8/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class VC: UIViewController {
//    let collectionView = UICollectionView()
    let tableView = UITableView()
    let names = ["Bil Gates","Steve Jobs","Mark Zucherberg","Test","Zhizn'","klass"]
    let cellIdentifier="cellIdentifier"
    let bullet="bullet"
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Bullet.self, forCellWithReuseIdentifier: bullet)
        collectionView.backgroundColor = UIColor.purple
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCell.self, forCellReuseIdentifier: cellIdentifier)
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        tableView.tableHeaderView = tableHeaderView
        tableView.tableHeaderView?.addSubview(collectionView)
        var collectionContraints = [NSLayoutConstraint]()
        collectionContraints += [
            collectionView.topAnchor.constraint(equalTo: tableHeaderView.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: tableHeaderView.bottomAnchor, constant: -10),
            collectionView.leftAnchor.constraint(equalTo: tableHeaderView.leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: tableHeaderView.rightAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(collectionContraints)
        view.layoutIfNeeded()
        let flowLayout=UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width-60.0, height: collectionView.frame.size.height-20.0)
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/2 - 10, height: 190)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 500, right: 5)
        flowLayout.minimumInteritemSpacing = 5.0
        collectionView.collectionViewLayout=flowLayout
        
        var constraints = [NSLayoutConstraint]()
        constraints += [
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
            
        ]
        NSLayoutConstraint.activate(constraints)
        tableView.translatesAutoresizingMaskIntoConstraints=false
        collectionView.translatesAutoresizingMaskIntoConstraints=false
        
    }
}

extension VC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyCell
        cell.namelabel.text=names[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}

class MyCell:UITableViewCell {
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
        label.translatesAutoresizingMaskIntoConstraints=false
       return label
    }()
    func setupViews(){
        addSubview(namelabel)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : namelabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : namelabel]))
    }
}

extension VC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bullet, for: indexPath) as! Bullet
        cell.textLabel.text=names[indexPath.row]
        return cell
    }
    
    
}
class Bullet:UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let textLabel:UILabel = {
        let label=UILabel()
        label.text="test"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    func setupViews(){
        addSubview(textLabel)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : textLabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : textLabel]))
    }
}
















//class CustomCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
//    let customCellIdentifier="customCellIdentifier"
//    let names = ["Bil Gates","Steve Jobs","Mark Zucherberg","Test","Zhizn'","klass"]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.backgroundColor=UIColor.white
//        collectionView.contentSize = CGSize(width: UIScreen.main.bounds.width/2 - 10, height: 190)
//        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: customCellIdentifier )
//        let flowLayout=UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width-60.0, height: collectionView.frame.size.height-20.0)
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/2 - 10, height: 190)
//        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 500, right: 5)
//        flowLayout.minimumInteritemSpacing = 5.0
//        collectionView.collectionViewLayout=flowLayout
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 200)
//    }
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! CustomCell
//        customCell.nameLabel.text=names[indexPath.item ]
//        return customCell
//    }
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return names.count
//    }
//}
//
//class CustomCell: UICollectionViewCell{
//    override init(frame: CGRect) {
//        super.init(frame:frame )
//        setupViews()
//    }
//    let nameLabel:UILabel = {
//        let label = UILabel()
//        label.text = "Custom Text"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    func setupViews(){
//        backgroundColor=UIColor.red
//        addSubview(nameLabel)
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : nameLabel]))
//
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}

