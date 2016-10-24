//
//  CreateViewController.swift
//  KnoWare
//
//  Created by Jeremy Storer on 10/22/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//

import UIKit
import Eureka
import Alamofire
import UIColor_Hex_Swift

class CreateViewController: FormViewController,SwiftColorPickerDelegate,UIPopoverPresentationControllerDelegate{

    var choiceOneColor:UIColor = UIColor()
    var choiceTwoColor:UIColor = UIColor()
    var choiceThreeColor:UIColor = UIColor()
    var choiceFourColor:UIColor = UIColor()
    var choiceFiveColor:UIColor = UIColor()
    var choiceSixColor:UIColor = UIColor()
    var linearColorOne:UIColor = UIColor()
    var linearColorTwo:UIColor = UIColor()
    var whichButton = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form = Section("Create Survey")
            <<< TextRow("question"){ row in
                row.title = "Question: "
                row.placeholder = "enter question"
                row.add(rule: RuleRequired())
                
            }
            <<< AlertRow<String>("question_type"){
                $0.title = "Type: "
                $0.selectorTitle = "Which type of survey?"
                $0.options = ["Multiple Choice","Numerical"]
                $0.value = "Multiple Choice"
            }
            <<< PushRow<String>("num_choices"){
                $0.title = "Number of Choices"
                $0.options = ["3","4","5","6"]
                $0.value = "3"
                $0.selectorTitle = "Select number of choices"
                $0.hidden = "$question_type !='Multiple Choice'"
            }
            
            +++ Section("Choices"){
                $0.hidden = "$question_type != 'Multiple Choice'"
            }
            <<< TextRow("choice_one"){
                $0.title = "Choice One: "
                $0.placeholder = "enter choice one"
                $0.hidden = "$question_type != 'Multiple Choice'"
                
            }
            <<< ButtonRow("choice_one_hex"){
                $0.title = "Color One"
                $0.hidden = "$question_type != 'Multiple Choice'"
                }
                .onCellSelection{cell, row in
                    
                    self.whichButton = 1
                    let colorPickerVC = SwiftColorPickerViewController()
                    colorPickerVC.delegate = self
                    colorPickerVC.numberColorsInXDirection = 60
                    colorPickerVC.numberColorsInYDirection = 68
                    colorPickerVC.modalPresentationStyle = .popover
                    let popVC = colorPickerVC.popoverPresentationController!;
                    popVC.sourceRect = CGRect(x: self.view.frame.midX, y:0.0, width: 0, height: 0)
                    popVC.sourceView = self.view
                    popVC.permittedArrowDirections = .any;
                    popVC.delegate = self;
                    self.present(colorPickerVC, animated: true, completion: nil)
                    
            }
            <<< TextRow("choice_two"){
                $0.title = "Choice Two: "
                $0.placeholder = "enter choice two"
                $0.hidden = "$question_type != 'Multiple Choice'"
            }
            <<< ButtonRow("choice_two_hex"){
                $0.title = "Color Two"
                $0.hidden = "$question_type != 'Multiple Choice'"
                
                }
                .onCellSelection{cell, row in
                    self.whichButton = 2
                    let colorPickerVC = SwiftColorPickerViewController()
                    colorPickerVC.delegate = self
                    colorPickerVC.numberColorsInXDirection = 60
                    colorPickerVC.numberColorsInYDirection = 68
                    colorPickerVC.modalPresentationStyle = .popover
                    let popVC = colorPickerVC.popoverPresentationController!;
                    popVC.sourceRect = CGRect(x: self.view.frame.midX, y:0.0, width: 0, height: 0)
                    popVC.sourceView = self.view
                    popVC.permittedArrowDirections = .any;
                    popVC.delegate = self;
                    self.present(colorPickerVC, animated: true, completion: nil)
                    
            }
            
            <<< TextRow("choice_three"){
                $0.title = "Choice Three: "
                $0.placeholder = "enter choice three"
                $0.hidden = "$question_type != 'Multiple Choice'"
            }
            <<< ButtonRow("choice_three_hex"){
                $0.title = "Color Three"
                $0.hidden = "$question_type != 'Multiple Choice'"
                
                }
                .onCellSelection{cell, row in
                    self.whichButton = 3
                    let colorPickerVC = SwiftColorPickerViewController()
                    colorPickerVC.delegate = self
                    colorPickerVC.numberColorsInXDirection = 60
                    colorPickerVC.numberColorsInYDirection = 68
                    colorPickerVC.modalPresentationStyle = .popover
                    let popVC = colorPickerVC.popoverPresentationController!;
                    popVC.sourceRect = CGRect(x: self.view.frame.midX, y:0.0, width: 0, height: 0)
                    popVC.sourceView = self.view
                    popVC.permittedArrowDirections = .any;
                    popVC.delegate = self;
                    self.present(colorPickerVC, animated: true, completion: nil)
                    
            }
            <<< TextRow("choice_four"){
                $0.title = "Choice Four: "
                $0.placeholder = "enter choice four"
                $0.hidden = "$num_choices == '3' || $question_type != 'Multiple Choice' || $question_type != 'Multiple Choice'"
            }
            <<< ButtonRow("choice_four_hex"){
                $0.title = "Color Four"
                $0.hidden = "$num_choices == '3' || $question_type != 'Multiple Choice' || $question_type != 'Multiple Choice'"
                
                }
                .onCellSelection{cell, row in
                    self.whichButton = 4
                    let colorPickerVC = SwiftColorPickerViewController()
                    colorPickerVC.delegate = self
                    colorPickerVC.numberColorsInXDirection = 60
                    colorPickerVC.numberColorsInYDirection = 68
                    colorPickerVC.modalPresentationStyle = .popover
                    let popVC = colorPickerVC.popoverPresentationController!;
                    popVC.sourceRect = CGRect(x: self.view.frame.midX, y:0.0, width: 0, height: 0)
                    popVC.sourceView = self.view
                    popVC.permittedArrowDirections = .any;
                    popVC.delegate = self;
                    self.present(colorPickerVC, animated: true, completion: nil)
                    
            }
            <<< TextRow("choice_five"){
                $0.title = "Choice Five: "
                $0.placeholder = "enter choice five"
                $0.hidden = "$num_choices == '4' || $num_choices =='3' || $question_type != 'Multiple Choice'"
            }
            <<< ButtonRow("choice_five_hex"){
                $0.title = "Color Five"
                $0.hidden = "$num_choices == '4' || $num_choices =='3' || $question_type != 'Multiple Choice'"
                }
                .onCellSelection{cell, row in
                    self.whichButton = 5
                    let colorPickerVC = SwiftColorPickerViewController()
                    colorPickerVC.delegate = self
                    colorPickerVC.numberColorsInXDirection = 60
                    colorPickerVC.numberColorsInYDirection = 68
                    colorPickerVC.modalPresentationStyle = .popover
                    let popVC = colorPickerVC.popoverPresentationController!;
                    popVC.sourceRect = CGRect(x: self.view.frame.midX, y:0.0, width: 0, height: 0)
                    popVC.sourceView = self.view
                    popVC.permittedArrowDirections = .any;
                    popVC.delegate = self;
                    self.present(colorPickerVC, animated: true, completion: nil)
                    
            }
            <<< TextRow("choice_six"){
                $0.title = "Choice Six: "
                $0.placeholder = "enter choice six"
                $0.hidden = "$num_choices != '6' || $question_type != 'Multiple Choice'"
            }
            <<< ButtonRow("choice_six_hex"){
                $0.title = "Color Six"
                $0.hidden = "$num_choices != '6' || $question_type != 'Multiple Choice'"
                }
                .onCellSelection{cell, row in
                    self.whichButton = 6
                    let colorPickerVC = SwiftColorPickerViewController()
                    colorPickerVC.delegate = self
                    colorPickerVC.numberColorsInXDirection = 60
                    colorPickerVC.numberColorsInYDirection = 68
                    colorPickerVC.modalPresentationStyle = .popover
                    let popVC = colorPickerVC.popoverPresentationController!;
                    popVC.sourceRect = CGRect(x: self.view.frame.midX, y:0.0, width: 0, height: 0)
                    popVC.sourceView = self.view
                    popVC.permittedArrowDirections = .any;
                    popVC.delegate = self;
                    self.present(colorPickerVC, animated: true, completion: nil)
                    
                }
            +++ Section("Numerical"){
                $0.hidden = "$question_type != 'Numerical'"
            }
            <<< TextRow("units"){
                $0.title = "Units: "
                $0.placeholder = "enter units"
            }
            <<< DecimalRow("min"){
                $0.title = "Min: "
                $0.placeholder = "enter minimum"
        }
            <<< DecimalRow("max"){
                $0.title = "Max: "
                $0.placeholder = "enter maximum"
        }
            <<< DecimalRow("stepSize"){
                $0.title = "Step Size: "
                $0.placeholder = "enter step size"
        }
            <<< ButtonRow("linear_hex_one"){
                $0.title = "Color Min"
                }
                .onCellSelection{cell, row in
                    self.whichButton = 7
                    let colorPickerVC = SwiftColorPickerViewController()
                    colorPickerVC.delegate = self
                    colorPickerVC.numberColorsInXDirection = 60
                    colorPickerVC.numberColorsInYDirection = 68
                    colorPickerVC.modalPresentationStyle = .popover
                    let popVC = colorPickerVC.popoverPresentationController!;
                    popVC.sourceRect = CGRect(x: self.view.frame.midX, y:0.0, width: 0, height: 0)
                    popVC.sourceView = self.view
                    popVC.permittedArrowDirections = .any;
                    popVC.delegate = self;
                    self.present(colorPickerVC, animated: true, completion: nil)
                    
        }
            <<< ButtonRow("linear_hex_two"){
                $0.title = "Color Max"
                
                }
                .onCellSelection{cell, row in
                    self.whichButton = 8
                    let colorPickerVC = SwiftColorPickerViewController()
                    colorPickerVC.delegate = self
                    colorPickerVC.numberColorsInXDirection = 60
                    colorPickerVC.numberColorsInYDirection = 68
                    colorPickerVC.modalPresentationStyle = .popover
                    let popVC = colorPickerVC.popoverPresentationController!;
                    popVC.sourceRect = CGRect(x: self.view.frame.midX, y:0.0, width: 0, height: 0)
                    popVC.sourceView = self.view
                    popVC.permittedArrowDirections = .any;
                    popVC.delegate = self;
                    self.present(colorPickerVC, animated: true, completion: nil)
                    
        }
            +++ Section("")
            <<< ButtonRow("submit_button"){
                $0.title = "Submit"
        }
                .onCellSelection{cell, row in
                    self.postToServer()
        }
        
    }
    func postToServer(){
        let dict = form.values()
        let question = dict["question"] as? String ?? "   "
        var responseType = dict["question_type"] as? String ?? "   "
        if(responseType == "Multiple Choice"){
            responseType = "multipleChoice"
        }
        if(responseType == "Numerical"){
            responseType = "numerical"
        }
        let min = dict["min"] as? String ?? "   "
        let max = dict["max"] as? String ?? "   "
        let units = dict["units"] as? String ?? "   "
        let stepSize = dict["stepSize"] as? String ?? "   "
        let choiceOne = dict["choice_one"] as? String ?? "   "
        var choiceOneHex:String = self.choiceOneColor.hexString()
        choiceOneHex.remove(at: choiceOneHex.startIndex)
        choiceOneHex = String(choiceOneHex.characters.dropLast(2))
        
        let choiceTwo = dict["choice_two"] as? String ?? "   "
        var choiceTwoHex:String = self.choiceTwoColor.hexString()
        choiceTwoHex.remove(at: choiceTwoHex.startIndex)
        choiceTwoHex = String(choiceTwoHex.characters.dropLast(2))
        
        let choiceThree = dict["choice_three"] as? String ?? "   "
        var choiceThreeHex:String = self.choiceThreeColor.hexString()
        choiceThreeHex.remove(at: choiceThreeHex.startIndex)
        choiceThreeHex = String(choiceThreeHex.characters.dropLast(2))
        
        var choiceFour = dict["choice_four"] as? String ?? "   "
        var choiceFourHex:String = self.choiceFourColor.hexString()
        choiceFourHex.remove(at: choiceFourHex.startIndex)
        choiceFourHex = String(choiceFourHex.characters.dropLast(2))
        
        var choiceFive = dict["choice_five"] as? String ?? "   "
        var choiceFiveHex:String = self.choiceFiveColor.hexString()
        choiceFiveHex.remove(at: choiceFiveHex.startIndex)
        choiceFiveHex = String(choiceFiveHex.characters.dropLast(2))
        
        var choiceSix = dict["choice_six"] as? String ?? "   "
        var choiceSixHex:String = self.choiceSixColor.hexString()
        choiceSixHex.remove(at: choiceSixHex.startIndex)
        choiceSixHex = String(choiceSixHex.characters.dropLast(2))
        
        var linearOneHex:String = self.linearColorOne.hexString()
        linearOneHex.remove(at: linearOneHex.startIndex)
        linearOneHex = String(linearOneHex.characters.dropLast(2))
        
        
        var linearTwoHex:String = self.linearColorTwo.hexString()
        linearTwoHex.remove(at: linearTwoHex.startIndex)
        linearTwoHex = String(linearTwoHex.characters.dropLast(2))
        
        let numChoices:String = (dict["num_choices"] as? String)!
        
        if (numChoices == "3"){
            choiceFourHex = ""
            choiceFour = ""
            choiceFiveHex = ""
            choiceFive = ""
            choiceSixHex = ""
            choiceSix = ""
        }else if(numChoices == "4"){
            choiceFiveHex = ""
            choiceFive = ""
            choiceSixHex = ""
            choiceSix = ""
        }else if(numChoices == "5"){
            choiceSixHex = ""
            choiceSix = ""
        }
        
        
        let parameters:Parameters = [
            "questionInput":question,
            "responseType":responseType,
            "minInput":min,
            "maxInput":max,
            "stepInput":stepSize,
            "unitsInput":units,
            "image":1,
            "choiceOneInput":choiceOne,
            "choiceOneHex":choiceOneHex,
            "choiceTwoInput":choiceTwo,
            "choiceTwoHex":choiceTwoHex,
            "choiceThreeInput":choiceThree,
            "choiceThreeHex":choiceThreeHex,
            "choiceFourInput":choiceFour,
            "choiceFourHex":choiceFourHex,
            "choiceFiveInput":choiceFive,
            "choiceFiveHex":choiceFiveHex,
            "choiceSixInput":choiceSix,
            "choiceSixHex":choiceSixHex,
            "linearHexOne":linearOneHex,
            "linearHexTwo":linearTwoHex
        ]
        
    
        Alamofire.request("http://jeremyjstorer.com/KnoWare/iOSKnoWare/createSurvey.php", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).response{response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
           print(response.error)
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func colorSelectionChanged(selectedColor color: UIColor) {
        if(self.whichButton == 1){
        self.form.rowBy(tag: "choice_one_hex")?.baseCell.backgroundColor = color
            self.choiceOneColor = color
        }
        if(self.whichButton==2){
        self.form.rowBy(tag: "choice_two_hex")?.baseCell.backgroundColor = color
            self.choiceTwoColor = color
        }
        if(self.whichButton==3){
            self.form.rowBy(tag: "choice_three_hex")?.baseCell.backgroundColor = color
            self.choiceThreeColor = color
        }
        if(self.whichButton==4){
            self.form.rowBy(tag: "choice_four_hex")?.baseCell.backgroundColor = color
            self.choiceFourColor = color
        }
        if(self.whichButton==5){
            self.form.rowBy(tag: "choice_five_hex")?.baseCell.backgroundColor = color
            self.choiceFiveColor = color
        }
        if(self.whichButton==6){
            self.form.rowBy(tag: "choice_six_hex")?.baseCell.backgroundColor = color
            self.choiceSixColor = color
        }
        if(self.whichButton==7){
            self.form.rowBy(tag: "linear_hex_one")?.baseCell.backgroundColor = color
            self.linearColorOne = color
        }
        if(self.whichButton==8){
            self.form.rowBy(tag: "linear_hex_two")?.baseCell.backgroundColor = color
            self.choiceSixColor = color
        }
        
        tableView?.reloadData()
        
    }
   
}
