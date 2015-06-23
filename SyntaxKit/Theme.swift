//
//  Theme.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 10/11/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit
#else
import UIKit
#endif

public typealias Attributes = [String: AnyObject]

public struct Theme {
  
  // MARK: - Properties
  
  public let UUID: String
  public let name: String
  public var attributes: [String: Attributes]?
  
  
  // MARK: - Initializers
  
  public init?(dictionary: [NSObject: AnyObject]) {
    if let UUID = dictionary["uuid"] as? String,
      name = dictionary["name"] as? String,
      rawSettings = dictionary["settings"] as? [[String: AnyObject]] {
        
        self.UUID = UUID
        self.name = name
        
        var attributes = [String: Attributes]()
        for raw in rawSettings {
          if let scopes = raw["scope"] as? String,
            var setting = raw["settings"] as? [String: AnyObject] {
              
              if let value = setting.removeValueForKey("foreground") as? String {
                setting[NSForegroundColorAttributeName] = Color(hex: value)
              }
              
              if let value = setting.removeValueForKey("background") as? String {
                setting[NSBackgroundColorAttributeName] = Color(hex: value)
              }
              
              // TODO: caret, invisibles, lightHighlight, selection, font style
              
              for scope in scopes.componentsSeparatedByString(",") {
                let key = scope.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                attributes[key] = setting
              }
          } else { continue }
          
          self.attributes = attributes
        }
        
    } else { return nil }
  }

}
