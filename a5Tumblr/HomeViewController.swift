//
//  HomeViewController.swift
//  a5Tumblr
//
//  Created by dt on 3/5/15.
//  Copyright (c) 2015 D3. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    // Main Content View
    @IBOutlet weak var contentView: UIView!
    
    // View Controllers
    var atHomeVc: UIViewController!
    var searchVc: UIViewController!
    var composeVc: UIViewController!
    var accountVc: UIViewController!
    var trendingVc: UIViewController!
    
    // Buttons
    @IBOutlet var buttons: [UIButton]!
    
    // Array
    var viewControllerArray = [UIViewController]()
    var selectedIndex: Int! = 0
    
    // Current View Controller
    var currentVc: UIViewController!
    
    // Explore Bubble
    @IBOutlet weak var exploreBubble: UIImageView!
    
    
    // Load  the View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Access the Storyboard
        var storyboard = UIStoryboard(name:"Main", bundle: nil)
        
        
        // Bounce the Explore Message
        
//        var exploreBubbleBounce = UIView.animateWithDuration(0.2, delay: 0.2, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
//            var bubbleStart = self.exploreBubble.center.y
//            
//            
//        }) { (Bool) -> Void in
//            //
//        }
        
      
        // Instantiate VCs: Start
        
        atHomeVc = storyboard.instantiateViewControllerWithIdentifier("AtHomeViewController") as UIViewController

        searchVc = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController

        composeVc = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController

        accountVc = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController

        trendingVc = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        
        // Vc Array
        
        viewControllerArray = [atHomeVc, searchVc, accountVc, trendingVc]
        
        // Show Explore Vc first
        currentVc = viewControllerArray[1]
        tabButton(buttons[1])


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Tab Button Actions: Start
    
    
    @IBAction func tabButton(sender: AnyObject) {
        removeChildView(currentVc)
        addChildViewController(viewControllerArray[selectedIndex])
        buttons[selectedIndex].selected = false //
        selectedIndex = sender.tag
        buttons[selectedIndex].selected = true //
        var selectedView = viewControllerArray[selectedIndex].view
        selectedView.frame = contentView.frame
        contentView.addSubview(selectedView)
        viewControllerArray[selectedIndex].didMoveToParentViewController(self)
        currentVc = viewControllerArray[selectedIndex]
        
//        println(sender.tag)
//        println("selected index \(selectedIndex)")
     
    }
    
    // Remove Child required function
    func removeChildView(content: UIViewController){
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    // Compose Button, Custom Segue
    @IBAction func composePress(sender: AnyObject) {
        performSegueWithIdentifier("composeSegue", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
