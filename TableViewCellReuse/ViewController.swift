//
//  ViewController.swift
//  TableViewCellReuse
//
//  Created by UrataHiroki on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
        
    var count = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 5
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 31
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        count = count + 1
        print(count)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        if cell.textLabel?.text != ""{
            
            cell.detailTextLabel?.text = cell.textLabel?.text
        }
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
}

class CustomCell:UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        print(style.rawValue)
        print(reuseIdentifier as Any)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        print(coder)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        if textLabel?.text != ""{
            
            detailTextLabel?.text = ""
            detailTextLabel?.text = textLabel!.text
        }
        
        backgroundColor = .systemGreen
        print("reuse")
        
    }
}


