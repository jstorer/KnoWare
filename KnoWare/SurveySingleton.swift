//
//  surveySingleton.swift
//  knowareSwift
//
//  Created by Jeremy Storer on 10/17/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//
import Foundation
import UIKit

final class SurveySingleton{
    fileprivate init(){}
    static let sharedInstance: SurveySingleton = SurveySingleton()
    var id:String = ""
    var question:String = ""
    var choiceOne:String = ""
    var choiceTwo:String = ""
    var choiceThree:String = ""
    var choiceFour:String = ""
    var choiceFive:String = ""
    var choiceSix:String = ""
    var choiceOneHex:String = ""
    var choiceTwoHex:String = ""
    var choiceThreeHex:String = ""
    var choiceFourHex:String = ""
    var choiceFiveHex:String = ""
    var choiceSixHex:String = ""
    var surveyType:String = ""
    
    var longitude:Double = 0.0
    var latitude:Double = 0.0
    var min:String = "0"
    var max:String = "0"
    var stepSize:String = "0"
    var linearHexOne:String = ""
    var linearHexTwo:String = ""
    
    var response:String = ""
    var hexResponse:String = ""
    
}
