//
//  ProfileScreen1ViewController.swift
//  Engaginbiz
//
//  Created by Bhavin on 27/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit

class ProfileScreen1ViewController: UIViewController {

    @IBOutlet weak var dislike: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var superlikeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dislikeButtonClicked(_ sender: UIButton) {
        
        print("clicked")
        
    }

    @IBAction func sendButtonClicked(_ sender: UIButton) {
        
        print("sendClicked")
    }
    
    @IBAction func superlikeButtonClicked(_ sender: UIButton) {
        print("superClicked")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
