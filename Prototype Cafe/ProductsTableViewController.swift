//
//  ProductsTableViewController.swift
//  Prototype Cafe
//
//  Created by Shana Moore on 6/19/16.
//  Copyright © 2016 Shana Moore. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        let product5 = Product()
        let product6 = Product()
        let product7 = Product()
        let product8 = Product()
        
        product1.name = "latte"
        product1.productImage = "latte-1"
        product1.cellImage = "latte"
        product1.productDescription = "yum"
        product1.productPrice = "$5.00"
        
        product2.name = "iced"
        product2.productImage = "iced-1"
        product2.cellImage = "iced"
        
        product3.name = "capuccino"
        product3.productImage = "capuccino-1"
        product3.cellImage = "capuccino"
        
        product4.name = "frappe"
        product4.productImage = "iced-1"
        product4.cellImage = "frappe"
        
        product5.name = "chai latte"
        product5.productImage = "mocha-1"
        product5.cellImage = "chai"
        
        product6.name = "venice"
        product6.productImage = "coffee"
        product6.cellImage = "venice"
        
        product7.name = "mocha"
        product7.productImage = "mocha-1"
        product7.cellImage = "mocha"
        
        product8.name = "americano"
        product8.productImage = "coffee"
        product8.cellImage = "americano"
        
        products = [product1, product2, product3, product4, product5, product6, product7, product8]
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let p = products {
            return p.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        
        let product = products?[indexPath.row]
        
        if let p = product {
            cell.textLabel?.text = p.name
            if let i = p.cellImage {
                cell.imageView?.image = UIImage(named: i)
            }
        }
        
        return cell
        
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if segue.identifier == "ShowProduct" {
            let productVC = segue.destinationViewController as? ProductViewController
            
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPathForCell(cell) else {
                return
            }
                productVC?.product = products?[indexPath.row]
            }
    }
}