//
//  ComposeViewController.swift
//  a5Tumblr
//
//  Created by dt on 3/5/15.
//  Copyright (c) 2015 D3. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    // Tab Buttons
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var isPresenting: Bool = true
    
    // Initializer: required to customize how this Vc is presented modally
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Transition Methods
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
//        println("animating transition")
        
        //
        
        if (isPresenting) {
            
                // Animate buttons in
                
                // Text Button Animation
                var textButtonStart = self.textButton.center.y + 400
                var textButtonEnd = self.textButton.center.y
                self.textButton.center.y = textButtonStart
                UIView.animateWithDuration(0.6) { () -> Void in
                    self.textButton.center.y = textButtonEnd
                }
                
                // Photo Button Animation
                var photoButtonStart = photoButton.center.y + 400
                var photoButtonEnd = photoButton.center.y
                photoButton.center.y = photoButtonStart
                UIView.animateWithDuration(0.1) { () -> Void in
                    self.photoButton.center.y = photoButtonEnd
                }
                
                // Quote Button Animation
                var quoteButtonStart = quoteButton.center.y + 400
                var quoteButtonEnd = quoteButton.center.y
                quoteButton.center.y = quoteButtonStart
                UIView.animateWithDuration(0.3) { () -> Void in
                    self.quoteButton.center.y = quoteButtonEnd
                }
                
                // Link Button Animation
                var linkButtonStart = linkButton.center.y + 400
                var linkButtonEnd = linkButton.center.y
                linkButton.center.y = linkButtonStart
                UIView.animateWithDuration(0.4) { () -> Void in
                    self.linkButton.center.y = linkButtonEnd
                }
                
                // Chat Button Animation
                var chatButtonStart = chatButton.center.y + 400
                var chatButtonEnd = chatButton.center.y
                chatButton.center.y = chatButtonStart
                UIView.animateWithDuration(0.2) { () -> Void in
                    self.chatButton.center.y = chatButtonEnd
                }
                
                // Video Button Animation
                var videoButtonStart = videoButton.center.y + 400
                var videoButtonEnd = videoButton.center.y
                videoButton.center.y = videoButtonStart
                UIView.animateWithDuration(0.5) { () -> Void in
                    self.videoButton.center.y = chatButtonEnd
                }
            
            
            //
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
            toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
         
//         Complete animating the buttons in
            
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    

    // Dismiss the modal and animate the buttons out

    @IBAction func nevermindPress(sender: AnyObject) {
        
        var textButtonFly = textButton.center.y - 400
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.textButton.center.y = textButtonFly
        })
        println("nevermind pressed")
    
        var photoButtonFly = photoButton.center.y - 400
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.photoButton.center.y = photoButtonFly
        })
        
        var quoteButtonFly = quoteButton.center.y - 400
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.quoteButton.center.y = quoteButtonFly
        })
        
        var linkButtonFly = linkButton.center.y - 400
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.linkButton.center.y = linkButtonFly
        })
        
        var chatButtonFly = chatButton.center.y - 400
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.chatButton.center.y = chatButtonFly
        })
        
        var videoButtonFly = videoButton.center.y - 400
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.videoButton.center.y = videoButtonFly
        })
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    

}
