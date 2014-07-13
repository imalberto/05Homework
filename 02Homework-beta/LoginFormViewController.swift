//
//  LoginFormViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 6/14/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController, UIAlertViewDelegate {


  @IBOutlet var signUpButton : UIButton = nil
  @IBOutlet var helpCenterButton : UIButton = nil
  @IBOutlet var loginButton : UIButton = nil
  @IBOutlet var logoImageView : UIImageView = nil
  @IBOutlet var loginButtonContainerView : UIView = nil
  @IBOutlet var activityIndicatorView : UIActivityIndicatorView = nil

  @IBOutlet var formContainerView : UIView = nil
  @IBOutlet var formImageView : UIImageView = nil
  @IBOutlet var usernameTextField : UITextField = nil
  @IBOutlet var passwordTextField : UITextField = nil



  @IBAction func onHelpCenterButton(sender : AnyObject) {
    NSLog("onHelpCenter")
  }

  @IBAction func onSignUpButton(sender : AnyObject) {
    NSLog("onSignUp")
  }

  @IBAction func onLoginButton(sender : AnyObject) {
    NSLog("onLogin")
    self.view.endEditing(true)
    self.mc = .LOGIN_IN_PROGRESS
    self.syncUI()

    let delay = 2.0 * Double(NSEC_PER_SEC)
    let time: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
    dispatch_after(time, dispatch_get_main_queue(), {
      if self.validateForm() {
        var store: CredStore = CredStore()
        if store.verify(self.usernameTextField.text, password: self.passwordTextField.text) {
          self.mc = .LOGGED_IN
          self.syncUI()
          
          let dummy = DummyViewController(nibName: nil, bundle: nil)
          let nfvc = NewsFeedViewController(nibName: nil, bundle: nil)
          let more = MoreViewController(nibName: nil, bundle: nil)

          let tab = UITabBarController()
          tab.tabBar.translucent = false
          tab.tabBar.barTintColor = UIColor.whiteColor()
          tab.tabBar.tintColor = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)
          let nav = UINavigationController(rootViewController: nfvc)
          nav.navigationBar.translucent = false
          tab.viewControllers = [
            nav,
            FriendRequestViewController(nibName: nil, bundle: nil),
            MessageViewController(nibName: nil, bundle: nil),
            NotificationViewController(nibName: nil, bundle: nil),
            more
          ]

          tab.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
          self.presentViewController(tab, animated: true, completion: nil)
          
        } else {
          self.mc = .NOT_LOGGED_IN
          self.syncUI()
          
          // show alert
          var av = UIAlertView()
          av.title = "Incorrect Password"
          av.message = "The password you entered is incorrect. Please try again"
          av.delegate = self
          av.addButtonWithTitle("OK")
          av.show()
        }
      } else {
        // tell user about invalid output
      }
      
    })
    
  }

  @IBAction func onEditingChangedUsername(sender : AnyObject) {
    NSLog("onEditingChanged Username")

    self.loginButton.enabled = (self.usernameTextField.text as NSString).length > 0;
  }
  @IBAction func onEditingChangedPassword(sender : AnyObject) {
    NSLog("onEditingChanged Password")
    self.loginButton.enabled = (self.usernameTextField.text as NSString).length > 0;
  }



  @IBAction func onTap(sender : UITapGestureRecognizer) {
    NSLog("onTap")
    self.view.endEditing(true)
  }
  
  func validateForm() -> Bool {
    // TODO
    return true;
  }

  // https://developer.apple.com/library/prerelease/ios/samplecode/UICatalog-Swift/Listings/UICatalog_TextViewController_swift.html
  func willShowKeyboard(notification: NSNotification) {
    NSLog("willShowKeyboard")
    self.animateViewsUp = true

    let userInfo:NSDictionary = notification.userInfo;
    
    let beginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as NSValue).CGRectValue()
    let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()

    let durationValue = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSValue) as NSNumber

    let animationDuration:NSTimeInterval = durationValue.doubleValue
    
    var animationOptions: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseOut
    let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSValue
    curveValue.getValue(&animationOptions)
    
    UIView.animateWithDuration(animationDuration, delay: 0.0, options: animationOptions, animations: {
      self.reconfigureView(beginFrame, endKbFrame: endFrame);
    }, completion: nil)
  }
  
  func willHideKeyboard(notification: NSNotification) {
    NSLog("willHideKeyboard")
    self.animateViewsUp = false

    let userInfo = notification.userInfo;

    // origin=(x=0, y=352) size=(width=320, height=216)
    // origin=(x=0, y=568) size=(width=320, height=216)
    let beginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as NSValue).CGRectValue();
    let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue();
    //
    let durationValue = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSValue) as NSNumber
    
    let animationDuration:NSTimeInterval = durationValue.doubleValue
    var animationOptions: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseOut
    let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSValue
    curveValue.getValue(&animationOptions)
    
    UIView.animateWithDuration(animationDuration, delay: 0.0, options: animationOptions, animations: {
      self.reconfigureView(beginFrame, endKbFrame:endFrame);
      }, completion: nil)
    
    
  }


  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "willShowKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "willHideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView();
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  /*
  // #pragma mark - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */
  
  // -- view stuff

  func syncUI() {
    if self.mc == .LOGIN_IN_PROGRESS {
      self.loginButton.setBackgroundImage(UIImage(named: "logging_in_button"), forState: UIControlState.Normal)
      self.activityIndicatorView .startAnimating()
    } else {
      self.loginButton.setBackgroundImage(UIImage(named: "login_button_disabled"), forState: UIControlState.Normal)
      self.activityIndicatorView.stopAnimating()
      self.resetTextFields()
    }
    self.loginButton.imageView.setNeedsDisplay()
  }

  func reconfigureView(beginKbFrame: CGRect, endKbFrame: CGRect) {
    var restore = !self.animateViewsUp;

    if restore {
      NSLog("Restore views")
      self.logoImageView.frame = self.viewsConfiguration["logoImageView"]!
      self.loginButtonContainerView.frame = self.viewsConfiguration["loginButtonContainerView"]!
      self.formContainerView.frame = self.viewsConfiguration["formContainerView"]!
      self.formImageView.frame = self.viewsConfiguration["formImageView"]!
      self.usernameTextField.frame = self.viewsConfiguration["usernameTextField"]!
      self.passwordTextField.frame = self.viewsConfiguration["passwordTextField"]!
      self.loginButton.frame = self.viewsConfiguration["loginButton"]!
      self.helpCenterButton.frame = self.viewsConfiguration["helpCenterButton"]!
    } else {
      NSLog("Animate views up")
      let y = endKbFrame.origin.y
      
      var frame: CGRect?
      frame = self.logoImageView.frame;
      self.logoImageView.frame = CGRectMake(frame!.origin.x, 50.0, frame!.size.width, frame!.size.height)
      frame = self.formContainerView.frame;
      self.formContainerView.frame = CGRectMake(frame!.origin.x,
        50.0 + self.logoImageView.frame.size.height + 50.0,
        frame!.size.width, frame!.size.height)

      frame = self.loginButtonContainerView.frame;
      self.loginButtonContainerView.frame = CGRectMake(frame!.origin.x,
        50.0 + self.logoImageView.frame.size.height + 50.0 + self.formContainerView.frame.height + 8.0,
        frame!.size.width, frame!.size.height)

      frame = self.helpCenterButton.frame
      self.helpCenterButton.frame = CGRectMake(frame!.origin.x,
        50.0 + self.logoImageView.frame.size.height + 50.0 + self.formContainerView.frame.height + 8.0 + self.loginButtonContainerView.frame.height + 20.0,
        frame!.size.width, frame!.size.height)
    }
  }

  func configureView() {
    self.view.backgroundColor = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)
    self.loginButton.enabled = false

    self.viewsConfiguration = [
      "logoImageView": self.logoImageView.frame,
      "loginButtonContainerView": self.loginButtonContainerView.frame,
      "formContainerView": self.formContainerView.frame,
      "usernameTextField": self.usernameTextField.frame,
      "passwordTextField": self.passwordTextField.frame,
      "formImageView": self.formImageView.frame,
      "loginButton": self.loginButton.frame,
      "helpCenterButton": self.helpCenterButton.frame
    ]
    
    self.passwordTextField.text = ""
  }

  func resetTextFields() {
    self.usernameTextField.text = ""
    self.passwordTextField.text = ""
    self.loginButton.enabled = false
  }

  func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
    if buttonIndex == 0 {
      self.resetTextFields()
    }
  }
  
  enum MC {
    case NOT_LOGGED_IN
    case LOGIN_IN_PROGRESS
    case LOGGED_IN
  }
  
  var mc:MC = .NOT_LOGGED_IN
  var animateViewsUp = false
  var viewsConfiguration: Dictionary<String, CGRect> = [:]
  
}
