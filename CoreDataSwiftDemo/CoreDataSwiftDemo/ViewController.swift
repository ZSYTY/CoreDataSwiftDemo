//
//  ViewController.swift
//  CoreDataSwiftDemo
//
//  Created by 吴浩 on 2018/1/26.
//  Copyright © 2018年 wuhao. All rights reserved.
//

import UIKit

func kRGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

class ViewController: UIViewController {
    
    let dataCellID = "dataCellID"
    var dataArray: [Person] = [Person]()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: view.frame.size.height / 2, width: view.frame.size.width, height: view.frame.size.height / 2), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: dataCellID)
        tableView.tableFooterView = UIView()
        return tableView
    }()
}


// MARK: - 按钮点击
extension ViewController {
    
    // 添加用户
    @IBAction func addPerson(_ sender: UIButton) {
        resignKeyboard()
        guard let nameString = nameTextField.text else { return }
        guard let ageString = ageTextField.text else { return }
        guard let age = Int16(ageString) else { return }
        CoreDataManager.shared.savePersonWith(name: nameString, age: age)
    }
    
    // 刷新列表
    @IBAction func reloadData(_ sender: UIButton) {
        resignKeyboard()
        dataArray = CoreDataManager.shared.getAllPerson()
        tableView.reloadData()
    }
    
    private func resignKeyboard() {
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
    }
}

// MARK: - 设置UI
extension ViewController {
    
    private func setupUI() {
        view.addSubview(tableView)
        setTextFieldUI(textField: nameTextField)
        setTextFieldUI(textField: ageTextField)
    }
    
    private func setTextFieldUI(textField: UITextField) {
        textField.textAlignment = NSTextAlignment.center
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.backgroundColor = kRGBCOLOR(r: 239, 239, 239)
        textField.layer.borderWidth = 0
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
    }
}

// MARK: - UITableViewDelegate，UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dataCellID, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        let person = dataArray[indexPath.row]
        let personInfo = person.name! + "\nAge: \(person.age)"
        cell.textLabel?.text = personInfo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let name = cell?.textLabel?.text?.components(separatedBy: "\n")
        CoreDataManager.shared.deleteWith(name: name![0])
        dataArray = CoreDataManager.shared.getAllPerson()
        tableView.reloadData()
    }
    
}

