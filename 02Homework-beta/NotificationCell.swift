//
//  NotificationCell.swift
//  02Homework-beta
//
//  Created by albertoc on 7/12/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

  @IBOutlet var photoImageView: UIImageView
  @IBOutlet var contentContainerView: UIView
  @IBOutlet var feedTextLabel: UILabel
  @IBOutlet var feedTypeImageView: UIImageView
  @IBOutlet var feedTimestampLabel: UILabel

  var placeholderImage = UIImage(named: "cell_placeholder")

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.contentContainerView.backgroundColor = UIColor.clearColor()

    // TODO based on the content height, adjust the Y

    feedTextLabel.numberOfLines = 3
    feedTextLabel.font = UIFont.systemFontOfSize(18)
    feedTextLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail

    feedTimestampLabel.font = UIFont.boldSystemFontOfSize(12)
    feedTimestampLabel.textColor = UIColor.lightGrayColor()

    photoImageView.image = placeholderImage

  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func configure(feed: Feed) {

    let styledHtml = styleHTMLWithHTML(feed.text)
    self.feedTextLabel.attributedText = self.attributedStringWithHTML(styledHtml)

    self.feedTimestampLabel.text = feed.when
    // self.feedTimestampLabel.text = feed.getTimestamp()

    self.feedTypeImageView.image = UIImage(named: feed.type)
    self.photoImageView.image = nil // set image here

    let url = NSURL(string: feed.imageUrl)
    let req = NSURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 60)
    photoImageView.image = UIImage(named: feed.image)
//    photoImageView.setImageWithURL(url)
//    photoImageView.image = UIImage(named: "cell_stock")
  }

  // private
  func styleHTMLWithHTML(html: String) -> String {
    let fontFamily = UIFont.systemFontOfSize(14).fontName
    let style = "<meta charset=\"UTF-8\"><style> body { font-family: '" + fontFamily + "'; font-size: 14px; } b {font-family: '" + fontFamily + "'; }</style>"

    return String(style + html)
  }
  func attributedStringWithHTML(html: String) -> NSAttributedString {

    let options = [
      NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
    ]
    var s = NSMutableAttributedString(data: html.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false), options: options, documentAttributes: nil, error: nil)
    let pp:NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
    pp.lineBreakMode = NSLineBreakMode.ByTruncatingTail
    s.addAttribute(NSParagraphStyleAttributeName, value: pp, range: NSMakeRange(0, s.length))

    return s.copy() as NSAttributedString
  }

}
