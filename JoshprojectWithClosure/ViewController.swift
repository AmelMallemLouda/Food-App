//
//  ViewController.swift
//  JoshprojectWithClosure
//
//  Created by Amel Mallem on 5/15/22.
//

import UIKit

class ViewController: UIViewController {

    
    var vm = ViewModel()
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.getDataFromViewModel()
        //here
        vm.closure = { self.processResponse()}
        self.tblView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }

    
    @objc func processResponse(){
        
        
        let error  = vm.error
        if error == nil {
            
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }

}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as? TableViewCell
        cell?.titleLabel.text = vm.myModel?.meals[indexPath.row].strMeal
        cell?.instructionLabel.text = vm.myModel?.meals[indexPath.row].strInstructions
        
        
        //here here here
        if let url = URL.init(string: vm.myModel?.meals[indexPath.row].strMealThumb ?? "") {
            
            DispatchQueue.global().async {
                
                if let data = try? Data.init(contentsOf: url){
                    DispatchQueue.main.async {
                        cell?.imgView?.image = UIImage(data: data)
                    }
                }
 
            }
        }
 
        return cell ?? TableViewCell()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
