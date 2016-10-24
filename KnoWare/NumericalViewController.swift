//
//  NumericalViewController.swift
//  KnoWare
//
//  Created by Jeremy Storer on 10/24/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//

import UIKit
import SnapKit
import UIColor_Hex_Swift

class NumericalViewController: UIViewController {
    var questionLabel:UILabel=UILabel()
    var responseLabel:UILabel = UILabel()
    var colorView:UIView = UIView()
    var valueSlider:UISlider = UISlider()
    var valueLabel:UILabel = UILabel()
    var hexSlider:UISlider = UISlider()
    var hexValue:String = String()
    var responseValue:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        self.view.addSubview(responseLabel)
        responseLabel.text = SurveySingleton.sharedInstance.min
        responseLabel.textAlignment = NSTextAlignment.center
        responseLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        responseLabel.numberOfLines = 0
        responseLabel.snp.makeConstraints{(make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(self.questionLabel.snp.bottom).offset(20)
        }
        
        self.view.addSubview(colorView)
        colorView.snp.makeConstraints{(make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalTo(self.responseLabel.snp.bottom).offset(50)
        }
        
        self.view.addSubview(valueSlider)
        valueSlider.minimumValue = Float(SurveySingleton.sharedInstance.min)!
        valueSlider.maximumValue = Float(SurveySingleton.sharedInstance.max)!
        valueSlider.addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
        valueSlider.snp.makeConstraints{(make)->Void in
            make.left.equalTo(self.view.frame.minX).offset(20)
            make.right.equalTo(self.view.frame.maxX).offset(-20)
            make.height.equalTo(20)
            make.top.equalTo(self.colorView.snp.bottom).offset(20)
        }
    }
    
    func sliderValueDidChange(sender: UISlider!){
        responseLabel.text = String(sender.value)
        var color1:UIColor = UIColor("#"+SurveySingleton.sharedInstance.linearHexOne)
        var color2:UIColor = UIColor("#"+SurveySingleton.sharedInstance.linearHexTwo)
        
        let min:CGFloat = CGFloat(Double(SurveySingleton.sharedInstance.min)!)
        let max:CGFloat = CGFloat(Double(SurveySingleton.sharedInstance.max)!)
        let value:CGFloat = CGFloat(Double(sender.value))
        
        let color3:UIColor = color1.interpolateRGBColorTo(end: color2, fraction: (value-min)/max )
        self.colorView.backgroundColor = color3
        

    }
}

extension UIColor {
    
    func interpolateRGBColorTo(end:UIColor, fraction:CGFloat) -> UIColor {
        var f = max(0, fraction)
        f = min(1, fraction)
        
        let c1 = self.cgColor.components
        let c2 = end.cgColor.components
        
        let r: Float = Float(c1![0] + (c2![0] - c1![0]) * f)
        let g: Float = Float(c1![1] + (c2![1] - c1![1]) * f)
        let b: Float = Float(c1![2] + (c2![2] - c1![2]) * f)
//        let r: CGFloat = CGFloat(c1[0] + (c2[0] - c1[0]) * f)
//        let g: CGFloat = CGFloat(c1[1] + (c2[1] - c1[1]) * f)
//        let b: CGFloat = CGFloat(c1[2] + (c2[2] - c1[2]) * f)
//        let a: CGFloat = CGFloat(c1[3] + (c2[3] - c1[3]) * f)
        
        return UIColor.init(red:CGFloat(r), green:CGFloat(g), blue:CGFloat(b), alpha:CGFloat(1))
    }
    
}
