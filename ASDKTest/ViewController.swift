//
//  ViewController.swift
//  ASDKTest
//
//  Created by Bartosz Górka on 03/06/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class ViewController: ASViewController {
    let cellTypes: [CellType] = [.Simple, .DescriptionSMC2, .Description, .Buttons, .DescriptionC3]
    
    var tableNode: ASTableNode {
        return node as! ASTableNode
    }
    
    init() {
        super.init(node: ASTableNode())
 
        tableNode.delegate = self
        tableNode.dataSource = self
        tableNode.view.separatorStyle = .None
        tableNode.view.showsVerticalScrollIndicator = false

        tableNode.backgroundColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewController: ASTableDataSource, ASTableDelegate {
    func tableView(tableView: ASTableView, nodeBlockForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
        let cellType = cellTypes[indexPath.row]
        let nodeBlock =  { () -> ASCellNode in
            let node = MainNode(cellType: cellType)
    
            return node
        }
        
        return nodeBlock
    
    }
//    func tableView(tableView: ASTableView, nodeForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNode {
//        
//        let node = MainNode(cellType: cellTypes[indexPath.row])
//        
//        return node
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
}
