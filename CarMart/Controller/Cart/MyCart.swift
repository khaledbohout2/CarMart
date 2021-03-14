//
//  MyCart.swift
//  CarMart
//
//  Created by Khaled Bohout on 10/02/2021.
//

import UIKit

class MyCart: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
    }
    
    func initTableView() {
        
        let cartItemNib = UINib(nibName: "CartItemCollectionViewCell", bundle: nil)
        cartTableView.register(cartItemNib, forCellReuseIdentifier: "CartItemCollectionViewCell")
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    

}

extension MyCart: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCollectionViewCell", for: indexPath)
        
        return cell
    }
    
    
    
}
