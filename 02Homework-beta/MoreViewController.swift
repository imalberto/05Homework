//
//  MoreViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 6/15/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController, UIActionSheetDelegate {

  @IBOutlet var logoutButton : UIButton = nil
  

  @IBAction func onLogoutButton(sender : AnyObject) {
    NSLog("Logout")
    
    let sheet = UIActionSheet()
    sheet.delegate = self
    sheet.title = "Are you sure you want to log out?"
    sheet.addButtonWithTitle("Log Out")
    sheet.addButtonWithTitle("Cancel")
    sheet.showFromTabBar(self.tabBarController.tabBar)
  }
  
  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
    self.tabBarItem.title = "More"
    self.tabBarItem.image = UIImage(named: "tabBar_More_Normal")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int) {
    switch (buttonIndex) {
    case 0:
      NSLog("logout")
      self.dismissViewControllerAnimated(true, completion: {})
    case 1:
      NSLog("cancel")
    default:
      break
    }
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
