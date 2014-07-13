//
//  NotificationDetailViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 7/13/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class NotificationDetailViewController: UIViewController {

  @IBOutlet var scrollView: UIScrollView

  init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
    super.init(nibName: nibName, bundle: nibBundleOrNil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationController.navigationBar.topItem.title = ""

    let tf = UITextField(frame: CGRectMake(0, 0, 256, 30))
    tf.backgroundColor = UIColor(red: 0.19, green: 0.28, blue: 0.47, alpha: 1)
    tf.layer.cornerRadius = 5

    let iv = UIImageView(image: UIImage(named: "navBar_search_group"))
    iv.center = tf.center
    tf.addSubview(iv)

    self.navigationItem.titleView = tf

    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
    scrollView.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
    let imageView = UIImageView(image: UIImage(named: "notification_detail"))
    imageView.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
    scrollView.contentSize = imageView.frame.size

    scrollView.addSubview(imageView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  /*
  // #pragma mark - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }
  */

}
