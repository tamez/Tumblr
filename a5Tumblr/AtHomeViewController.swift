//
//  AtHomeViewController.swift
//  a5Tumblr
//
//  Created by dt on 3/5/15.
//  Copyright (c) 2015 D3. All rights reserved.
//

import UIKit

class AtHomeViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Login Button, Custom Segue
    @IBAction func loginButtonDidTap(sender: AnyObject) {
        performSegueWithIdentifier("loginSegue", sender: nil)
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
