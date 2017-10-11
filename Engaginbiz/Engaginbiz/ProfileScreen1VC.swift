//
//  ProfileScreen1VC.swift
//  Engaginbiz
//
//  Created by Bhavin on 29/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit

class ProfileScreen1VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        // Do any additional setup after loading the view.
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return 3
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath) as! CategoryCell
            
            cell.titleLabel.text = "Its happeneing"
            cell.layer.cornerRadius = 12
        
           return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(collectionView.frame.width) - 28
        
        return CGSize(width: width, height: width - 130)
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
