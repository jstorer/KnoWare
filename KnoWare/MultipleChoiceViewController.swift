//
//  MultipleChoiceViewController.swift
//  KnoWare
//
//  Created by Jeremy Storer on 10/20/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//

import UIKit
import SwiftyButton
import SnapKit
import UIColor_Hex_Swift
import SCLAlertView
import Alamofire

class MultipleChoiceViewController: UIViewController {

    var questionLabel:UILabel = UILabel()
    var answerLabel:UILabel = UILabel()
    var choiceOneButton:SwiftyButton = SwiftyButton()
    var choiceTwoButton:SwiftyButton = SwiftyButton()
    var choiceThreeButton:SwiftyButton = SwiftyButton()
    var choiceFourButton:SwiftyButton = SwiftyButton()
    var choiceFiveButton:SwiftyButton = SwiftyButton()
    var choiceSixButton:SwiftyButton = SwiftyButton()
    var submitButton:SwiftyButton = SwiftyButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.title = SurveySingleton.sharedInstance.id
        submitButton.isEnabled = false
        
        self.view.addSubview(questionLabel)
        questionLabel.text = SurveySingleton.sharedInstance.question
        questionLabel.textAlignment = NSTextAlignment.center
        questionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        questionLabel.numberOfLines = 0
        questionLabel.snp.makeConstraints{(make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
        }
        
        self.view.addSubview(choiceOneButton)
        choiceOneButton.setTitle(SurveySingleton.sharedInstance.choiceOne, for: .normal)
        choiceOneButton.buttonColor = UIColor("#"+SurveySingleton.sharedInstance.choiceOneHex)
        choiceOneButton.shadowColor = UIColor.black
        choiceOneButton.cornerRadius = 5
        choiceOneButton.addTarget(self, action: #selector(choiceOneButtonPressed), for: .touchUpInside)
        choiceOneButton.snp.makeConstraints{(make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(self.questionLabel.snp.bottom).offset(10)
            
        }
        
        self.view.addSubview(choiceTwoButton)
        choiceTwoButton.setTitle(SurveySingleton.sharedInstance.choiceTwo, for: .normal)
        choiceTwoButton.buttonColor = UIColor("#"+SurveySingleton.sharedInstance.choiceTwoHex)
        choiceTwoButton.shadowColor = UIColor.black
        choiceTwoButton.cornerRadius = 5
        choiceTwoButton.addTarget(self, action: #selector(choiceTwoButtonPressed), for: .touchUpInside)
        choiceTwoButton.snp.makeConstraints{(make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(self.choiceOneButton.snp.bottom).offset(10)
            
        }
        
        self.view.addSubview(choiceThreeButton)
        choiceThreeButton.setTitle(SurveySingleton.sharedInstance.choiceThree, for: .normal)
        choiceThreeButton.buttonColor = UIColor("#"+SurveySingleton.sharedInstance.choiceThreeHex)
        choiceThreeButton.shadowColor = UIColor.black
        choiceThreeButton.cornerRadius = 5
        choiceThreeButton.addTarget(self, action: #selector(choiceThreeButtonPressed), for: .touchUpInside)
        choiceThreeButton.snp.makeConstraints{(make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(self.choiceTwoButton.snp.bottom).offset(10)
            
        }
        
        if(SurveySingleton.sharedInstance.choiceFour.characters.count > 0){
            self.view.addSubview(choiceFourButton)
            choiceFourButton.setTitle(SurveySingleton.sharedInstance.choiceFour, for: .normal)
            choiceFourButton.buttonColor = UIColor("#"+SurveySingleton.sharedInstance.choiceFourHex)
            choiceFourButton.shadowColor = UIColor.black
            choiceFourButton.cornerRadius = 5
            choiceFourButton.addTarget(self, action: #selector(choiceFourButtonPressed), for: .touchUpInside)
            choiceFourButton.snp.makeConstraints{(make)->Void in
                make.width.equalToSuperview()
                make.height.equalTo(50)
                make.top.equalTo(self.choiceThreeButton.snp.bottom).offset(10)
            }
        }
        
        if(SurveySingleton.sharedInstance.choiceFive.characters.count > 0){
            self.view.addSubview(choiceFiveButton)
            choiceFiveButton.setTitle(SurveySingleton.sharedInstance.choiceFive, for: .normal)
            choiceFiveButton.buttonColor = UIColor("#"+SurveySingleton.sharedInstance.choiceFiveHex)
            choiceFiveButton.shadowColor = UIColor.black
            choiceFiveButton.cornerRadius = 5
            choiceFiveButton.addTarget(self, action: #selector(choiceFiveButtonPressed), for: .touchUpInside)
            choiceFiveButton.snp.makeConstraints{(make)->Void in
                make.width.equalToSuperview()
                make.height.equalTo(50)
                make.top.equalTo(self.choiceFourButton.snp.bottom).offset(10)
            
            }
        }
        
        if(SurveySingleton.sharedInstance.choiceSix.characters.count > 0){
            self.view.addSubview(choiceSixButton)
            choiceSixButton.setTitle(SurveySingleton.sharedInstance.choiceSix, for: .normal)
            choiceSixButton.buttonColor = UIColor("#"+SurveySingleton.sharedInstance.choiceSixHex)
            choiceSixButton.shadowColor = UIColor.black
            choiceSixButton.cornerRadius = 5
            choiceSixButton.addTarget(self, action: #selector(choiceSixButtonPressed), for: .touchUpInside)
            choiceSixButton.snp.makeConstraints{(make)->Void in
                make.width.equalToSuperview()
                make.height.equalTo(50)
                make.top.equalTo(self.choiceFiveButton.snp.bottom).offset(10)
            
            }
        }
        
        self.view.addSubview(submitButton)
        submitButton.setTitle("Submit Response", for: .normal)
        submitButton.buttonColor = UIColor.gray
        submitButton.shadowColor = UIColor.black
        submitButton.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        submitButton.snp.makeConstraints{(make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top).offset(-10)
        }
        
        self.view.addSubview(answerLabel)
        answerLabel.textAlignment = NSTextAlignment.center
        answerLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        answerLabel.numberOfLines = 0
        answerLabel.snp.makeConstraints{(make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalTo(submitButton.snp.top).offset(-10)
        }
    }
    
    func choiceOneButtonPressed(){
        submitButton.isEnabled = true
        answerLabel.text = "You have Selected "+SurveySingleton.sharedInstance.choiceOne
        SurveySingleton.sharedInstance.response = SurveySingleton.sharedInstance.choiceOne
        SurveySingleton.sharedInstance.hexResponse = SurveySingleton.sharedInstance.choiceOneHex
    }
    
    func choiceTwoButtonPressed(){
        submitButton.isEnabled = true
        answerLabel.text = "You have Selected "+SurveySingleton.sharedInstance.choiceTwo
        SurveySingleton.sharedInstance.response = SurveySingleton.sharedInstance.choiceTwo
        SurveySingleton.sharedInstance.hexResponse = SurveySingleton.sharedInstance.choiceTwoHex
    }
    
    func choiceThreeButtonPressed(){
        submitButton.isEnabled = true
        answerLabel.text = "You have Selected "+SurveySingleton.sharedInstance.choiceThree
        SurveySingleton.sharedInstance.response = SurveySingleton.sharedInstance.choiceThree
        SurveySingleton.sharedInstance.hexResponse = SurveySingleton.sharedInstance.choiceThreeHex
    }
    
    func choiceFourButtonPressed(){
        submitButton.isEnabled = true
        answerLabel.text = "You have Selected "+SurveySingleton.sharedInstance.choiceFour
        SurveySingleton.sharedInstance.response = SurveySingleton.sharedInstance.choiceFour
        SurveySingleton.sharedInstance.hexResponse = SurveySingleton.sharedInstance.choiceFourHex
    }
    
    func choiceFiveButtonPressed(){
        submitButton.isEnabled = true
        answerLabel.text = "You have Selected "+SurveySingleton.sharedInstance.choiceFive
        SurveySingleton.sharedInstance.response = SurveySingleton.sharedInstance.choiceFive
        SurveySingleton.sharedInstance.hexResponse = SurveySingleton.sharedInstance.choiceFiveHex
    }
    
    func choiceSixButtonPressed(){
        submitButton.isEnabled = true
        answerLabel.text = "You have Selected "+SurveySingleton.sharedInstance.choiceSix
        SurveySingleton.sharedInstance.response = SurveySingleton.sharedInstance.choiceSix
        SurveySingleton.sharedInstance.hexResponse = SurveySingleton.sharedInstance.choiceSixHex
    }
    
    func submitButtonPressed(){
        let appearance = SCLAlertView.SCLAppearance(showCloseButton:false)
        let alertView = SCLAlertView(appearance: appearance)
        alertView.addButton("Submit With Image"){
            self.navigationController?.pushViewController(CaptureImageViewController(), animated: false)
            print("Add Image")
        }
        alertView.addButton("Submit Without Image"){
            let parameters: Parameters = [
                "id":SurveySingleton.sharedInstance.id,
                "response":SurveySingleton.sharedInstance.response,
                "longitude":SurveySingleton.sharedInstance.longitude,
                "latitude":SurveySingleton.sharedInstance.latitude,
                "hexcolor":SurveySingleton.sharedInstance.hexResponse,
                "hasImage": 1
            ]
            
            Alamofire.request("http://jeremyjstorer.com/KnoWare/iOSKnoWare/uploadResponse.php", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).response{response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.error)                
            }
            
            var viewControllers:[UIViewController] = (self.navigationController?.viewControllers)!
            let numViews = viewControllers.count
            viewControllers.removeLast(numViews-2)
            viewControllers.append(MapViewController())
            self.navigationController?.setViewControllers(viewControllers, animated: false)
            

            print("No Image")
        }
        alertView.addButton("Cancel"){
            print("Cancel")
        }
        alertView.showNotice("Add An Image?", subTitle: "You may submit your answer with or without a corresponding image")
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}
