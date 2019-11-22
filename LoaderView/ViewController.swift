//
//  ViewController.swift
//  LoaderView
//
//  Created by JAYANTA GOGOI on 11/19/19.
//  Copyright © 2019 JAYANTA GOGOI. All rights reserved.
//

import UIKit


class LoaderCell: UITableViewCell {
    
    //Define Animation Component
    var loadingAnimation: ComponentLoading?

    //stop animation while job is done
    var cellText: String?{
                
        didSet{
            self.loadingAnimation?.StopAnimation()
            self.loadingAnimation = nil // release from memory
        }
       
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //add Here for Show Loader
        self.loadingAnimation = ComponentLoading(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        self.addSubview(self.loadingAnimation!)
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}





class ViewController: UIViewController {

    var loader: ComponentLoading?
    
    let tableView : UITableView = {
        
        let tv  = UITableView(frame: CGRect.zero)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        tableView.register(LoaderCell.self, forCellReuseIdentifier: "cell")
        self.view.addConstraintWithFormat(formate: "H:|[v0]|", views: tableView)
        self.view.addConstraintWithFormat(formate: "V:|[v0]|", views: tableView)
        
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LoaderCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! LoaderCell
        cell.cellText = "Gogoi"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
}

