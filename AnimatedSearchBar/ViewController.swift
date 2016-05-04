//
//  ViewController.swift
//  AnimatedSearchBar
//
//  Created by 刘业臻 on 16/5/4.
//  Copyright © 2016年 luiyezheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: AnimatedSearchBar!
    
    @IBAction func reSet(sender: AnyObject) {
        imageView.hidden = true
        searchBar.reSet()
    }

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.hidden = true
        
        searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        imageView.hidden = false
        searchBar.text = ""
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        if let bar = searchBar as? AnimatedSearchBar {
            if bar.searchField.hidden {
                return false
            }
        }

        return true
    }

}

