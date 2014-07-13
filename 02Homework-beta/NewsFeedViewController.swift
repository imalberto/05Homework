//
//  NewsFeedViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 6/15/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

  @IBOutlet var activityIndicatorView : UIActivityIndicatorView = nil
  @IBOutlet var statusButton : UIButton = nil
  @IBOutlet var scrollContainerView : UIView = nil
  @IBOutlet var statusImageView : UIImageView = nil
  @IBOutlet var feedScrollView : UIScrollView = nil
  @IBOutlet var feedImageView : UIImageView = nil



  @IBAction func onStatusButton(sender : AnyObject) {
    NSLog("submit status")
    
    let c = ComposeViewController(nibName: nil, bundle: nil)
    let nav = UINavigationController(rootViewController: c)
    nav.navigationBar.translucent = false
    nav.navigationBar.tintColor = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)
    nav.navigationBar.barTintColor = UIColor.whiteColor()
 
    c.modalTransitionStyle = UIModalTransitionStyle.CoverVertical

    nav.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
    self.presentViewController(nav, animated: true, completion: nil)
  }


  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
    self.tabBarItem.title = "News Feed"
    self.tabBarItem.image = UIImage(named: "tabBar_NewsFeed_Normal")

    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Search, target: nil, action: nil)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: nil, action: nil)
    let titleLabel = UILabel()
    titleLabel.textColor = UIColor.whiteColor()
    titleLabel.text = "News Feed"
    titleLabel.backgroundColor = UIColor.clearColor()
    titleLabel.sizeToFit()
    self.navigationItem.titleView = titleLabel
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.activityIndicatorView.startAnimating()
    self.scrollContainerView.layer.opacity = 0.0
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC)))
    dispatch_after(time, dispatch_get_main_queue(), {
        self.activityIndicatorView.stopAnimating()
        self.scrollContainerView.layer.opacity = 1.0
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  /*
  // #pragma mark - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  }
  */

}
