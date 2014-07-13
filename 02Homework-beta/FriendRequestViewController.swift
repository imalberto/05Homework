//
//  FriendRequestViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 6/15/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class FriendRequestViewController: UIViewController {

  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
    self.tabBarItem.title = "Requests"
    self.tabBarItem.image = UIImage(named: "tabBar_People_Normal")

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
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
