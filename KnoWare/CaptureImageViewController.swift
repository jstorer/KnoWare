//
//  CaptureImageViewController.swift
//  KnoWare
//
//  Created by Jeremy Storer on 10/21/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//

import UIKit
import SwiftyButton
import Alamofire

class CaptureImageViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var retakeButton:SwiftyButton = SwiftyButton()
    var submitButton:SwiftyButton = SwiftyButton()
    var takenImageView:UIImageView = UIImageView()
    var imagePicker:UIImagePickerController = UIImagePickerController()
    var image:UIImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(submitButton)
        submitButton.buttonColor = UIColor.gray.flatten()
        submitButton.highlightedColor = UIColor.lightGray.flatten()
        submitButton.shadowColor = UIColor.black.flatten()
        submitButton.shadowHeight = 0
        submitButton.cornerRadius = 5
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(self.submitButtonPressed), for: .touchUpInside)
        submitButton.snp.makeConstraints{
            (make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalTo(self.view.snp.bottom).offset(-10)
        }
        
        self.view.addSubview(retakeButton)
        retakeButton.buttonColor = UIColor.gray.flatten()
        retakeButton.highlightedColor = UIColor.lightGray.flatten()
        retakeButton.shadowColor = UIColor.black.flatten()
        retakeButton.shadowHeight = 0
        retakeButton.cornerRadius = 5
        retakeButton.setTitle("Retake", for: .normal)
        retakeButton.addTarget(self, action: #selector(self.retakeButtonPressed), for: .touchUpInside)
        retakeButton.snp.makeConstraints{
            (make)->Void in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalTo(submitButton.snp.top).offset(-10)
        }
        
        self.view.addSubview(takenImageView)
        takenImageView.backgroundColor = UIColor.black
        takenImageView.snp.makeConstraints{
            (make)->Void in
            make.width.equalToSuperview()
            make.bottom.equalTo(retakeButton.snp.top).offset(-10)
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
        }
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker,animated: true,completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        self.takenImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    

    func submitButtonPressed(){
        self.image = resizeImage(self.takenImageView.image!, newWidth: 700)!
        
        let imageData:Data = UIImageJPEGRepresentation(image, 0.4)! as Data
        let strBase64:String = imageData.base64EncodedString(options: .lineLength64Characters)
        
        let parameters: Parameters = [
            "id":SurveySingleton.sharedInstance.id,
            "response":SurveySingleton.sharedInstance.response,
            "longitude":SurveySingleton.sharedInstance.longitude,
            "latitude":SurveySingleton.sharedInstance.latitude,
            "hexcolor":SurveySingleton.sharedInstance.hexResponse,
            "hasImage": 1,
            "image":strBase64
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
    }
    
    func retakeButtonPressed(){
        present(imagePicker,animated: true,completion: nil)
    }
    
    func resizeImage(_ image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}


