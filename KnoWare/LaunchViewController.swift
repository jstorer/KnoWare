//
//  LaunchViewController.swift
//  KnoWare
//
//  Created by Jeremy Storer on 10/20/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//

import UIKit
import SwiftyButton
import SnapKit
import ChameleonFramework
import Swift


class LaunchViewController: UIViewController{
    let surveyButton: SwiftyButton = SwiftyButton()
    let createButton: SwiftyButton = SwiftyButton()
    let knowareLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        
        
        self.view.addSubview(knowareLabel)
        knowareLabel.text = "KnoWare"
        knowareLabel.textAlignment = NSTextAlignment.center
        knowareLabel.font = UIFont(name: "Futura-Bold", size: 65)
        knowareLabel.adjustsFontSizeToFitWidth = true
        knowareLabel.snp.makeConstraints {
            (make) -> Void in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.center.equalTo(self.view)
        }

        self.view.addSubview(surveyButton)
        surveyButton.buttonColor = UIColor.gray.flatten()
        surveyButton.highlightedColor = UIColor.lightGray.flatten()
        surveyButton.shadowColor = UIColor.black.flatten()
        surveyButton.shadowHeight = 0
        surveyButton.cornerRadius = 5
        surveyButton.setTitle("Surveys", for: .normal)
        surveyButton.addTarget(self, action: #selector(self.surveysButtonPressed), for: .touchUpInside)
        surveyButton.snp.makeConstraints {
            (make) -> Void in
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.right.equalTo(self.view.snp.right).offset(-20)
        }

        self.view.addSubview(createButton)
        createButton.buttonColor = UIColor.gray.flatten()
        createButton.highlightedColor = UIColor.lightGray.flatten()
        createButton.shadowColor = UIColor.black.flatten()
        createButton.shadowHeight = 0
        createButton.cornerRadius = 5
        createButton.setTitle("Create", for: .normal)
        createButton.addTarget(self, action: #selector(self.createButtonPressed), for: .touchUpInside)
        createButton.snp.makeConstraints {
            (make) -> Void in
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.left.equalTo(self.view.snp.left).offset(20)
        }
    }


    func surveysButtonPressed() {
        navigationController?.pushViewController(SurveyListViewController(), animated: false)
    }

    func createButtonPressed(_ sender:UIButton) {
        self.navigationController?.pushViewController(CreateViewController(), animated: false)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}
