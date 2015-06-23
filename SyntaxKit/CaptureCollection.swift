//
//  CaptureCollection.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 9/19/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

public struct CaptureCollection {
  
  // MARK: - Properties
  
  private let captures: [UInt: Capture]
  
  var captureIndexes: [UInt] {
    var keys = captures.keys.array
    keys.sort() { $0 < $1 }
    return keys
  }
  
  
  // MARK: - Initializers
  
  init?(dictionary: [NSObject: AnyObject]) {
    if let dictionary = dictionary as? [String: [String: String]] {
      var captures = [UInt: Capture]()
      for (key, value) in dictionary {
        if let key = key.toInt(), capture = Capture(dictionary: value) {
          captures[UInt(key)] = capture
        }
      }
      self.captures = captures
    } else {
      return nil
    }
  }
  
  
  // MARK: - Accessing Captures
  
  public func captureAtIndex(index: UInt) -> Capture? {
    return captures[index]
  }
}

