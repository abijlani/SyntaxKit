//
//  CaptureCollection.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 9/19/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

struct CaptureCollection {

	// MARK: - Properties

	private let captures: [Int: Capture]

	var captureIndexes: [Int] {
		var keys = captures.keys.array
    keys.sort() { $0 < $1 }
		return keys
	}


	// MARK: - Initializers

	init?(dictionary: [NSObject: AnyObject]) {
    if let dictionary = dictionary as? [Int: [String: String]] {
      var captures = [Int: Capture]()
      for (key, value) in dictionary {
        if let capture = Capture(dictionary: value) {
          captures[key] = capture
        }
      }
      self.captures = captures
    } else {
      return nil
    }
	}


	// MARK: - Accessing Captures

	subscript(index: Int) -> Capture? {
		return captures[index]
	}
}
