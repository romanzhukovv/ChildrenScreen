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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func addChildButtonAction() {
        
    }
    @IBAction func clearInfoButtonAction() {
        
    }
    
}

extension ChildrenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = childrenTableView.dequeueReusableCell(withIdentifier: "childCell") as! ChildViewCell
        return cell
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
