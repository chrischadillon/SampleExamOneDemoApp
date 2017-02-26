//
//  File.swift
//  SampleExam
//
//  Created by Chris Chadillon on 2017-02-26.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import Foundation

class Person {
    var theName:String
    var theAvatar:String!
    
    init(theName:String, theAvatar:String! = nil) {
        self.theName = theName
        self.theAvatar = theAvatar
    }
}
