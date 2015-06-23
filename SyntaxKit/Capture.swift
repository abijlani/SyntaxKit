//
//  Capture.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 9/18/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

public struct Capture {

	// MARK: - Properties

	public let name: String


	// MARK: - Initializers
	
	init?(dictionary: [NSObject: AnyObject]) {
    if let name = dictionary["name"] as? String {
      self.name = name
    } else {
      return nil
    }
	}
}
