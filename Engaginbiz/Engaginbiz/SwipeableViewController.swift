//
//  ViewController.swift
//  swipe
//
//  Created by Bhavin on 01/09/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit
import ZLSwipeableViewSwift
import Cartography
import UIColor_FlatColors

class SwipeableViewController: UIViewController, SomeUIViewDelegate {
    
    @IBOutlet weak var rightSwipeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var superLikeButton: UIButton!
    var swipeableView: ZLSwipeableView!
    var take = 0
    
    var login: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "icon_hamburg_menu"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 58/255, green: 128/255, blue: 188/255, alpha: 1)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.restorationIdentifier="loginbutton"
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    
   // @IBOutlet weak var label: UILabel!
    var colors = ["Turquoise", "Green Sea", "Emerald", "Nephritis", "Peter River", "Belize Hole", "Amethyst", "Wisteria", "Wet Asphalt", "Midnight Blue", "Sun Flower", "Orange", "Carrot", "Pumpkin", "Alizarin", "Pomegranate", "Clouds", "Silver", "Concrete", "Asbestos"]
    var colorIndex = 0
    var loadCardsFromXib = true
    
    /* var reloadBarButtonItem: UIBarButtonItem!
     // var reloadBarButtonItem = UIBarButtonItem(barButtonSystemItem: "Reload", target: .Plain) { item in }
     var leftBarButtonItem: UIBarButtonItem!
     // var leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: "←", target: .Plain) { item in }
     var upBarButtonItem: UIBarButtonItem!
     // var upBarButtonItem = UIBarButtonItem(barButtonSystemItem: "↑", target: .Plain) { item in }
     var rightBarButtonItem: UIBarButtonItem!
     // var rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: "→", target: .Plain) { item in }
     var downBarButtonItem:UIBarButtonItem!
     // var downBarButtonItem = UIBarButtonItem(barButtonSystemItem: "↓", target: .Plain) { item in }*/
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setToolbarHidden(false, animated: false)
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        
        var shareButton = UIButton()
        shareButton.setBackgroundImage(#imageLiteral(resourceName: "icon-user"), for: .normal)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        var chatButton = UIButton()
        chatButton.setBackgroundImage(#imageLiteral(resourceName: "icon-chat"), for: .normal)
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        
        /*var label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 32)
        label.textColor = UIColor(red: 103/255, green: 58/58, blue: 183/255, alpha: 1)*/
        
        /*  reloadBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(reloadButtonAction))
         leftBarButtonItem = UIBarButtonItem(title: "←", style: .plain, target: self, action: #selector(leftButtonAction))
         upBarButtonItem = UIBarButtonItem(title: "↑", style: .plain, target: self, action: #selector(upButtonAction))
         rightBarButtonItem = UIBarButtonItem(title: "→", style: .plain, target: self, action: #selector(rightButtonAction))
         downBarButtonItem = UIBarButtonItem(title: "↓", style: .plain, target: self, action: #selector(downButtonAction))
         
         let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
         let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
         
         let items = [fixedSpace, reloadBarButtonItem!, flexibleSpace, leftBarButtonItem!, flexibleSpace, upBarButtonItem!, flexibleSpace, rightBarButtonItem!, flexibleSpace, downBarButtonItem!, fixedSpace]
         toolbarItems = items*/
        
        swipeableView = ZLSwipeableView()
        view.addSubview(swipeableView)
        view.addSubview(shareButton)
        view.addSubview(chatButton)
        
        
        swipeableView.didStart = {view, location in
            //view.translatesAutoresizingMaskIntoConstraints = false
            print("Did start swiping view at location: \(location)")
        }
        swipeableView.swiping = {view, location, translation in
            print("Swiping at view location: \(location) translation: \(translation)")
        }
        swipeableView.didEnd = {view, location in
            print("Did end swiping view at location: \(location)")
        }
        swipeableView.didSwipe = {view, direction, vector in
            print("Did swipe view in direction: \(direction), vector: \(vector)")
        }
        swipeableView.didCancel = {view in
            print("Did cancel swiping view")
        }
        swipeableView.didTap = {view, location in
            print("Did tap at location \(location)")
        }
        swipeableView.didDisappear = { view in
            print("Did disappear swiping view")
        }
        
        constrain(swipeableView, view) { view1, view2 in
            view1.left == view2.left+50
            view1.right == view2.right-50
            view1.top == view2.top + 100
            view1.bottom == view2.bottom - 150
        }
        
        constrain(shareButton, swipeableView) { view1, view2 in
            //view1.left == view2.left+50
            //view1.right == view2.right-50
            //view1.top == view2.top + 100
            view1.bottom == view2.top - 50
        }
        
        constrain(shareButton, view) { view1, view2 in
            view1.left == view2.left+20
            view1.right == view2.right-270
            view1.top == view2.top + 25
        }
        
        constrain(chatButton, swipeableView) { view1, view2 in
            view1.bottom == view2.top - 50
        }
        
        constrain(chatButton, view) { view1, view2 in
            view1.left == view2.left+270
            view1.right == view2.right-20
            view1.top == view2.top + 25
        }
        
    }
    
    // MARK: - Actions
    
    func reloadButtonAction() {
        let alertController = UIAlertController(title: nil, message: "Load Cards:", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let ProgrammaticallyAction = UIAlertAction(title: "Programmatically", style: .default) { (action) in
            self.loadCardsFromXib = false
            self.colorIndex = 0
            self.swipeableView.discardViews()
            self.swipeableView.loadViews()
        }
        alertController.addAction(ProgrammaticallyAction)
        
        let XibAction = UIAlertAction(title: "From Xib", style: .default) { (action) in
            self.loadCardsFromXib = true
            self.colorIndex = 0
            self.swipeableView.discardViews()
            self.swipeableView.loadViews()
        }
        alertController.addAction(XibAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func leftButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Left)
    }
    
    @IBAction func upButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Up)
    }
    
    @IBAction func rightButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Right)
    }
    
    func downButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Down)
    }
    
    // MARK: ()
    func nextCardView() -> UIView? {
        if colorIndex >= colors.count {
            colorIndex = 0
        }
        
        
        
        let cardView = CardView(frame: swipeableView.bounds)
        
        //cardView.delegate = self
        
        
        cardView.backgroundColor = colorForName(colors[colorIndex])
        
        /*constrain(loginRegisterButton, cardView) { view1, view2 in
            view1.left == view2.left
            view1.top == view2.top
            view1.width == cardView.bounds.width
            view1.height == cardView.bounds.height
        }*/
        
        
        //cardView.addSubview(login)
        
        //loginRegisterButton.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
       // loginRegisterButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12).isActive = true
       // loginRegisterButton.widthAnchor.constraint(equalTo: cardView.widthAnchor).isActive = true
       // loginRegisterButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
       // loginRegisterButton.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        
        
       /* constrain(login, cardView) { view1, view2 in
            view1.left == view2.left
            view1.top == view2.top
            view1.width == cardView.bounds.width
            view1.height == cardView.bounds.height - 50
        }*/
        
        colorIndex += 1
        
        //   reloadButtonAction()
        
        if loadCardsFromXib {
            let contentView = Bundle.main.loadNibNamed("CardContentView", owner: self, options: nil)?.first! as! CardView
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.backgroundColor = cardView.backgroundColor
            
            contentView.profileButton.translatesAutoresizingMaskIntoConstraints = false
            contentView.profileButton.layer.cornerRadius = 10.0
            

            if (take == 0){
                contentView.profileButton.setBackgroundImage(#imageLiteral(resourceName: "maple_leaf-1280x800"), for: .normal)
               // contentView.nameLabel.text = "hello"
                take+=1
            }else{
                contentView.profileButton.setBackgroundImage(#imageLiteral(resourceName: "Bhavin Agarwal"), for: .normal)
               // contentView.nameLabel.text = "BYE BYE"
            }
            
            contentView.delegate = self
            
            // This is important:
            // https://github.com/zhxnlai/ZLSwipeableView/issues/9
            // Alternative:
            /* let metrics = ["width":cardView.bounds.width, "height": cardView.bounds.height]
             let views = ["contentView": contentView, "cardView": cardView]
             cardView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[contentView(width)]", options: .alignAllLeft, metrics: metrics, views: views))
             cardView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[contentView(height)]", options: .alignAllLeft, metrics: metrics, views: views))*/
 
            cardView.addSubview(contentView)
            
            constrain(contentView, cardView) { view1, view2 in
                view1.left == view2.left
                view1.top == view2.top
                view1.width == cardView.bounds.width
                view1.height == cardView.bounds.height
            }
        }
        
        //name.leftAnchor.constraint(equalTo: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: <#T##CGFloat#>)
        
        // cardView.addSubview(name)
        
        return cardView
    }
    
    func colorForName(_ name: String) -> UIColor {
        let sanitizedName = name.replacingOccurrences(of: " ", with: "")
        let selector = "flat\(sanitizedName)Color"
        return UIColor.perform(Selector(selector)).takeUnretainedValue() as! UIColor
    }
    
    func handleLoginRegister(){
        print("HI")
    }
    
    func segueFunction() {
        print("Button pressed in controller")
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
}
