//
// IBViewController.swift
// TableViewDataManager
//
// Copyright (c) 2016 Roman Efimov (https://github.com/romaonthego)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit
import TableViewDataManager

class IBViewController: UITableViewController {

    // Lazy initialize the table view manager
    //
    lazy var manager: TableViewDataManager = {
        let manager = TableViewDataManager(tableView: self.tableView)
        
        // Register a Nib for an item class
        //
        manager.registerNib(UINib(nibName: "IBTableViewCell", bundle: NSBundle.mainBundle()), forItemClass: IBTableViewItem.self)
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.manager.dataSource!.sections.append({
            let section = TableViewSection()
            for i in 1...10 {
                var lines : [String] = []
                for index in 1...i {
                    lines.append("Line \(index)")
                }
                let item = IBTableViewItem(text: lines.joinWithSeparator("\n"))
                item.selectable = false
                section.items.append(item)
            }
            return section
        }())
    }
}
