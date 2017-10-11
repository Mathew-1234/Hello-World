//
//  MyViewController.swift
//  Engaginbiz
//
//  Created by Bhavin on 10/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Variables for loggedIn and profile user
    var loggedInUser: User?
    var profileUser: User?
    
    var requestPrposals = [Proposal]()
    var submitProposal = [Proposal]()
    
    var requestCategory = [Category]()
    var submitcategory = [Category]()
    
    var sectionChangeCount: Int = 0
    
    var currentSection: String?

    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentSection = "Request"
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        setupProposalCount()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // This is to get how many submit and how many request categories are there
        if currentSection == "Request"{
            print("request count")
            flipCurrentSection()
            return requestCategory.count
        }else{
            print("submit count")
            return submitcategory.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        // To change the heading of the headerview
        
        
        currentSection = "Request"
        sectionChangeCount += 1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        if sectionChangeCount == requestCategory.count{
            
            currentSection = "Submit"

            if submitcategory.count != 0{
            print("submit ", indexPath.row)
                    cell.labelCat.text = submitcategory[indexPath.row].name
            }
            
        }else{
            
            print("request",indexPath.row)
            cell.labelCat.text = requestCategory[indexPath.row].name
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        flipCurrentSection()
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! MyCollectionReusableView
        
        header.headerLabel.text = currentSection
        
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        
        return CGSize(width: width, height: width)
    }
    
    private func setupProposalCount(){
        
        //If the intent is one of them, then the its of request category , submit otherwise
        
        for intent in (profileUser?.intents)!{
            
            print(intent.typeString!)
            if (intent.typeString == "fieldOfWork" || intent.typeString == "myIndustry" || intent.typeString == "likeToSponsorFor" || intent.typeString == "likeToInvestIn" || intent.typeString == "likeToVolunteerFor"){
                self.requestCategory.append(intent)
            }else{
                self.submitcategory.append(intent)
            }
        }
        
        return
    }
    
    private func flipCurrentSection(){
        
        if currentSection == "Request"{
            currentSection = "Submit"
        }else{
            currentSection = "Request"
        }
        
    }


}
