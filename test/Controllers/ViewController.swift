//
//  ViewController.swift
//  test
//
//  Created by Володимир on 10/9/17.
//  Copyright © 2017 Володимир. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var userData: (login:String,cookie:String)?
    let entities = ["Студенти", "Групи", "Факультети", "Спеціальності"]
    
    @IBOutlet weak var enteties: UICollectionView!
    @IBOutlet weak var user: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.text = "User: \(userData!.login)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "entety", for: indexPath) as! EntetiesCollectionViewCell
        cell.labelEntety.text = entities[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print(indexPath.row)
            self.performSegue(withIdentifier: "students", sender: userData)
            print("go go!")
        }
    }
}

