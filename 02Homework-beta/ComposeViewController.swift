//
//  ComposeViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 6/15/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
  @IBOutlet var navigationBar : UINavigationBar = nil
  @IBOutlet var statusTextView : UITextView = nil
  @IBOutlet var hiddenLabel : UITextField = nil


  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "onDismissMe:")
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: UIBarButtonItemStyle.Plain, target: self, action: "onPostStatus:")
    let titleLabel: UILabel = UILabel()
    titleLabel.textColor = UIColor.blackColor()
    titleLabel.text = "Update Status"
    titleLabel.sizeToFit()
    titleLabel.backgroundColor = UIColor.clearColor()
    self.navigationItem.titleView = titleLabel
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.statusTextView.delegate = self
    self.statusTextView.backgroundColor = UIColor.whiteColor()
    self.statusTextView.text = ""
    self.statusTextView.becomeFirstResponder()
    // self.statusTextView.frame = CGRectMake(70, 106, 250, 207)
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func onDismissMe(sender: AnyObject?) {
    NSLog("onDismissMe")
    self.dismissViewControllerAnimated(true, completion: {});
  }
  func onPostStatus(sender: AnyObject?) {
    NSLog("onPostStatus")
    self.dismissViewControllerAnimated(true, completion: {});
  }

  func textViewDidBeginEditing(textView: UITextView!) {

  }
  
  func textViewDidChange(textView: UITextView!) {
    if textView.text.bridgeToObjectiveC().length > 0 {
      self.hiddenLabel.hidden = true
    } else {
      self.hiddenLabel.hidden = false
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
