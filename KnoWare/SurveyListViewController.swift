//
//  SurveyListViewController.swift
//  KnoWare
//
//  Created by Jeremy Storer on 10/20/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MGSwipeTableCell
import ChameleonFramework

class SurveyListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, MGSwipeTableCellDelegate {
    var surveyTableView: UITableView = UITableView()
    var arrRes = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surveyTableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        surveyTableView.delegate = self
        surveyTableView.dataSource = self
        surveyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.surveyTableView)
        
        let url:String = "http://jeremyjstorer.com/KnoWare/iOSKnoWare/getSurveys.php"
        Alamofire.request(url).responseJSON{(responseData) ->Void in
            if((responseData.result.value) != nil){
                let swiftyJSONVar = JSON(responseData.result.value!)
                if let resData = swiftyJSONVar["surveys"].arrayObject{
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0{
                    self.surveyTableView.reloadData()
                }
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dict = arrRes[indexPath.row]
        let cell:MGSwipeTableCell=MGSwipeTableCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel!.text = dict["question"] as? String
        cell.detailTextLabel!.text = dict["id"] as? String
        
       cell.delegate = self
        
       cell.rightButtons = [MGSwipeButton(title: "View", backgroundColor: UIColor.orange.flatten()),MGSwipeButton(title:"Answer",backgroundColor:UIColor.blue.flatten())]
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var dict = arrRes[indexPath.row]
        let cell = self.surveyTableView.cellForRow(at: indexPath) as! MGSwipeTableCell
        cell.showSwipe(MGSwipeDirection.rightToLeft, animated: true)
        SurveySingleton.sharedInstance.id             = (dict["id"] as? String)!
        SurveySingleton.sharedInstance.question       = (dict["question"] as? String)!
        SurveySingleton.sharedInstance.choiceOne      = (dict["choice_one"] as? String)!
        SurveySingleton.sharedInstance.choiceTwo      = (dict["choice_two"] as? String)!
        SurveySingleton.sharedInstance.choiceThree    = (dict["choice_three"] as? String)!
        SurveySingleton.sharedInstance.choiceFour     = (dict["choice_four"] as? String)!
        SurveySingleton.sharedInstance.choiceFive     = (dict["choice_five"] as? String)!
        SurveySingleton.sharedInstance.choiceSix      = (dict["choice_six"] as? String)!
        SurveySingleton.sharedInstance.choiceOneHex   = (dict["choice_one_hex"] as? String)!
        SurveySingleton.sharedInstance.choiceTwoHex   = (dict["choice_two_hex"] as? String)!
        SurveySingleton.sharedInstance.choiceThreeHex = (dict["choice_three_hex"] as? String)!
        SurveySingleton.sharedInstance.choiceFourHex  = (dict["choice_four_hex"] as? String)!
        SurveySingleton.sharedInstance.choiceFiveHex  = (dict["choice_five_hex"] as? String)!
        SurveySingleton.sharedInstance.choiceSixHex   = (dict["choice_six_hex"] as? String)!
        SurveySingleton.sharedInstance.surveyType     = (dict["response_type"] as? String)!
        SurveySingleton.sharedInstance.min = (dict["response_range_start"] as? String)!
        SurveySingleton.sharedInstance.max = (dict["response_range_end"] as? String)!
        SurveySingleton.sharedInstance.stepSize = (dict["response_step"] as? String)!
        SurveySingleton.sharedInstance.linearHexOne = (dict["linear_hex_1"] as? String)!
        SurveySingleton.sharedInstance.linearHexTwo = (dict["linear_hex_2"] as? String)!
    }
    
    func swipeTableCell(_ cell: MGSwipeTableCell, tappedButtonAt index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        if(index==0){
            self.navigationController?.pushViewController(MapViewController(), animated: false)
        }
        if(index==1){
            if(SurveySingleton.sharedInstance.surveyType == "multipleChoice"){
        self.navigationController?.pushViewController(MultipleChoiceViewController(), animated: false)
            }
            if(SurveySingleton.sharedInstance.surveyType == "numerical"){
                    self.navigationController?.pushViewController(NumericalViewController(), animated: false)
            }
        }
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}
