//
//  CredStore.swift
//  02Homework-beta
//
//  Created by albertoc on 6/15/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import Foundation

class CredStore {
  
  var _username: String = "xxx"
  var _password: String = "password"
  
  init() {
    
  }
  
  func verify(username: String, password: String) -> Bool {
    
    var result = false
    
    if password == self._password {
      NSLog("Validate creds OK.")
      result = true
    } else {
      NSLog("Validate creds failed. Incorrect username or password.")
    }
    return result
  }
  
}