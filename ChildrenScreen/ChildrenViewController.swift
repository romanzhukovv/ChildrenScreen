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
    
    private var childrenList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
    }

    @IBAction func addChildButtonAction() {
        addChild()
    }
    
    @IBAction func deleteChildButtonAction(_ sender: UIButton) {
        deleteChild(sender: sender)
    }
    
    
    @IBAction func clearInfoButtonAction() {
        showActionSheet()
    }
    
}

extension ChildrenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        childrenList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = childrenTableView.dequeueReusableCell(withIdentifier: "childCell") as! ChildViewCell
        cell.selectionStyle = .none
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
    
    private func addChild() {
        if childrenList.count < 5 {
            childrenList.insert(1, at: 0)

            childrenTableView.beginUpdates()
            childrenTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
            childrenTableView.endUpdates()
            
            if childrenList.count == 5 {
                addChildButton.isHidden = true
            }
        }
    }
    
    private func deleteChild(sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: childrenTableView)
        guard let indexPath = childrenTableView.indexPathForRow(at: point) else { return }
        childrenList.remove(at: indexPath.row)
        childrenTableView.beginUpdates()
        childrenTableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        childrenTableView.endUpdates()
        
        if childrenList.count < 5 {
            addChildButton.isHidden = false
        }
    }
    
    private func showActionSheet() {
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let clearInfoAction = UIAlertAction(title: "Сбросить данные", style: .destructive) { _ in
            self.childrenList = []
            self.childrenTableView.reloadData()
            self.parentName.text = ""
            self.parentAge.text = ""
            self.addChildButton.isHidden = false
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        actionSheetController.addAction(clearInfoAction)
        actionSheetController.addAction(cancelAction)
        
        present(actionSheetController, animated: true, completion: nil)
    }
}
