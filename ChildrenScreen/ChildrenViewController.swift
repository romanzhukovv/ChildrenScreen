//
//  ViewController.swift
//  ChildrenScreen
//
//  Created by Roman Zhukov on 08.03.2022.
//

import UIKit

class ChildrenViewController: UIViewController {
    @IBOutlet var childrenTableView: UITableView!
    @IBOutlet var addChildButton: UIButton!
    @IBOutlet var clearInfoButton: UIButton!
    @IBOutlet var parentName: UITextField!
    @IBOutlet var parentAge: UITextField!
    
    
    
    
    private var childCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func addChildButtonAction() {
        if childCount != 5 {
            childCount += 1
            childrenTableView.reloadData()
        } else {
            addChildButton.isHidden = true
        }
    }
    @IBAction func clearInfoButtonAction() {
        childCount = 0
        childrenTableView.reloadData()
        parentName.text = ""
        parentAge.text = ""
        addChildButton.isHidden = false
    }
    
}

extension ChildrenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        childCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = childrenTableView.dequeueReusableCell(withIdentifier: "childCell") as! ChildViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

extension ChildrenViewController {
    private func setupUI() {
        addChildButton.layer.cornerRadius = 20
        addChildButton.layer.borderWidth = 2
        addChildButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        clearInfoButton.layer.cornerRadius = 20
        clearInfoButton.layer.borderWidth = 2
        clearInfoButton.layer.borderColor = UIColor.systemRed.cgColor
    }
    
}
