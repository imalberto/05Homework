//
//  Feed.swift
//  02Homework-beta
//
//  Created by albertoc on 7/12/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class Feed: NSObject {

  var text: String!
  var when: String!
  var timestamp: NSTimeInterval!
  var type: String!
  var image: String! // image name
  var imageUrl: String!

  var formatter: NSDateFormatter!


  init(dict:NSDictionary) {
    super.init()

    formatter = (UIApplication.sharedApplication().delegate as AppDelegate).formatter
    
    text = dict.objectForKey("text") as String
    type = dict.objectForKey("type") as String
    image = dict.objectForKey("image") as String
    imageUrl = dict.objectForKey("imageUrl") as String

    let t = dict.objectForKey("timestamp") as NSNumber

    timestamp = NSTimeInterval(t.doubleValue)
    when = dict.objectForKey("when") as String
  }

  func getImageUrl() -> NSURL {
    var url = NSURL(string: self.imageUrl)
    return url
  }

  func getTimestamp() -> NSString {
    var date = NSDate(timeIntervalSince1970: self.timestamp)
    var out = formatter.stringFromDate(date)

    return out
  }
   
}
