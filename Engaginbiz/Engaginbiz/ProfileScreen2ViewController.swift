//
//  ProfileScreen2ViewController.swift
//  Engaginbiz
//
//  Created by Bhavin on 27/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//

import UIKit

class ProfileScreen2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


//
//  MyPageVC.swift
//  Engaginbiz
//
//  Created by Bhavin on 21/08/17.
//  Copyright © 2017 Bhavin. All rights reserved.
//
/*
import UIKit
 
 UIScreen.main.bounds.maxY - 50

class MyPageVC: UIPageViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    lazy var array: [UIViewController] = {
        return [self.VCInstance(name: "ThirdVC")]
    }()
    
    private func VCInstance(name: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate  = self
        
        if let firstVC = array.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        
    }
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        
        guard let VCIndex = array.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = VCIndex - 1
        
        guard previousIndex >= 0 else{
            return array.last
        }
        
        guard array.count > previousIndex else {
            return nil
        }
        
        return array[previousIndex]
        
        
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        
        guard let VCIndex = array.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = VCIndex + 1
        
        guard nextIndex <= array.count else{
            return array.first
        }
        
        guard array.count > nextIndex else {
            return nil
        }
        
        return array[nextIndex]
        
    }
    
    /* override func viewDidLayoutSubviews() {
     super.viewDidLayoutSubviews()
     
     // get pageControl and scroll view from view's subviews
     let pageControl = view.subviews.filter{ $0 is UIPageControl }.first! as! UIPageControl
     let scrollView = view.subviews.filter{ $0 is UIScrollView }.first! as! UIScrollView
     // remove all constraint from view that are tied to pagecontrol
     let const = view.constraints.filter { $0.firstItem as? NSObject == pageControl || $0.secondItem as? NSObject == pageControl }
     view.removeConstraints(const)
     
     // customize pagecontroll
     pageControl.translatesAutoresizingMaskIntoConstraints = false
     pageControl.layer.masksToBounds = true
     pageControl.addConstraint(pageControl.heightAnchor.constraint(equalToConstant: 35))
     pageControl.backgroundColor = UIColor.red
     //pageControl.pageIndicatorTintColor = UIColor(red: 103, green: 58, blue: 183, alpha: 1)
     pageControl.currentPageIndicatorTintColor = UIColor(red: 58/255, green: 128/255, blue: 188/255, alpha: 1)
     
     
     // create constraints for pagecontrol
     let leading = pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
     let trailing = pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
     let bottom = pageControl.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0) // add to scrollview not view
     
     // pagecontrol constraint to view
     view.addConstraints([leading, trailing, bottom])
     view.bounds.origin.y -= pageControl.bounds.maxY
     }
     */
    
    // A page indicator will be visible if both methods are implemented, transition style is 'UIPageViewControllerTransitionStyleScroll', and navigation orientation is 'UIPageViewControllerNavigationOrientationHorizontal'.
    // Both methods are called in response to a 'setViewControllers:...' call, but the presentation index is updated automatically in the case of gesture-driven navigation.
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return array.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstVC = viewControllers?.first,
            let firstVCIndex = array.index(of: firstVC) else {
                return 0
        }
        
        return firstVCIndex
        
    }
}
*/
