//
//  NotificationViewController.swift
//  02Homework-beta
//
//  Created by albertoc on 6/15/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  var manager: AFHTTPRequestOperationManager!
  var feeds = [Feed]()

  @IBOutlet var tableView: UITableView


  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization

    self.tabBarItem.title = "Notifications"
    self.tabBarItem.image = UIImage(named: "tabBar_Notifications_Normal")

    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: "onSearch:")
    let img = UIImage(named: "nav_friendsglyph_active")
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: img, style: UIBarButtonItemStyle.Plain, target: self, action: "onMessages:")

    manager = AFHTTPRequestOperationManager()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.tableView.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)

    // Do any additional setup after loading the view.

    let titleLabel = UILabel(frame:CGRectZero)
    titleLabel.text = "Notifications"
    titleLabel.textColor = UIColor.whiteColor()
    titleLabel.font = UIFont.boldSystemFontOfSize(17)
    titleLabel.sizeToFit()
    self.navigationItem.titleView = titleLabel
    tableView.dataSource = self
    tableView.delegate = self

    let nib = UINib(nibName: "NotificationCell", bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: "NotificationCell")

    let url = "http://localhost:3000/data"
    let req: NSURLRequest = NSURLRequest(URL: NSURL(string: url))
    let data:NSData = NSURLConnection.sendSynchronousRequest(req, returningResponse: nil, error: nil)
    let object:NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
    for o in object {
      let dict = o as NSDictionary
      let feed = Feed(dict: dict)
      self.feeds.append(feed)
    }
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

  func onSearch(sender: UIBarButtonItem) {
    NSLog("onSearch")
  }
  func onMessages(sender: UIBarButtonItem) {
    NSLog("onMessages")
  }

  func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
    return 80
  }

  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return feeds.count
  }

  func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {

    let vc = NotificationDetailViewController(nibName: nil, bundle: nil)
    self.navigationController.pushViewController(vc, animated: true)

    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    var cell: NotificationCell!

    cell = tableView.dequeueReusableCellWithIdentifier("NotificationCell") as NotificationCell

    let feed = self.feeds[indexPath.row]

    cell.configure(feed)

//    manager.GET(feed.imageUrl, parameters: nil, success: {(_, responseObject) in
//      }, failure: { (_, error) in })

    return cell

//    let cell2 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "NotificationCell")
//    return cell2

  }

}
