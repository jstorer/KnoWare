//
//  MapViewController.swift
//  KnoWare
//
//  Created by Jeremy Storer on 10/20/16.
//  Copyright © 2016 Jeremy Storer. All rights reserved.
//

import UIKit
import GoogleMaps
import SwiftyJSON
import Alamofire
import UIColor_Hex_Swift
import Kingfisher

class MapViewController: UIViewController,GMSMapViewDelegate {

    var mapView:GMSMapView = GMSMapView()
    let path = GMSMutablePath()
    var arrRes = [[String:AnyObject]]()
    var response = String()
    var markerArray:[GMSMarker] = [GMSMarker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = SurveySingleton.sharedInstance.id
        let url:String = "http://jeremyjstorer.com/KnoWare/iOSKnoWare/getAnswers.php?id="+SurveySingleton.sharedInstance.id
        
        let camera = GMSCameraPosition.camera(withLatitude: SurveySingleton.sharedInstance.latitude, longitude: SurveySingleton.sharedInstance.longitude, zoom: 6)
        mapView = GMSMapView.map(withFrame: UIScreen.main.bounds, camera: camera)
        view.addSubview(self.mapView)
        mapView.delegate = self
        
        Alamofire.request(url).responseJSON{ (responseData)->Void in
            let swiftyJSONVar = JSON(responseData.result.value!)
            if let resData = swiftyJSONVar["answers"].arrayObject{
                self.arrRes = resData as! [[String:AnyObject]]
            }
            if self.arrRes.count > 0 {
                for answer in self.arrRes{
                    var markerDict:[String:String] = ["response":answer["response"] as! String]
                    var image_name:String = answer["image_name"] as? String ?? ""
                    
                    markerDict["image_name"] = answer["image_name"] as? String
                    
                    let hexColorString:String = answer["hexcolor"] as! String
                    let lat = answer["latitude"]?.doubleValue
                    let long = answer["longitude"]?.doubleValue
                    let position = CLLocationCoordinate2DMake(lat!, long!)
                    let marker = GMSMarker(position: position)
                    
                    marker.icon = GMSMarker.markerImage(with: UIColor("#"+hexColorString))
                    marker.opacity = 0.6
                    marker.infoWindowAnchor = CGPoint(x: 0.0, y: 0.0)
                    marker.userData = markerDict
                    self.path.add(position)
                    marker.map = self.mapView
                }
                let bounds = GMSCoordinateBounds(path: self.path)
                self.mapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 15.0))
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
//    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
//        
//        let infoWindow = Bundle.main.loadNibNamed("MarkerInfoWindow", owner: self, options: nil)?.first! as! MarkerInfoWindow
//        
//        if let dict = marker.userData as? [String:String]{
//            infoWindow.responseLabel.text = dict["response"]
//            if((dict["image_name"]) != nil){
//                let url = URL(string:"http://jeremyjstorer.com/KnoWare/uploadFiles/"+dict["image_name"]!)
//                let data = Data(contentsOf: url! as URL)
//                if data != nil{
//                    infoWindow.responseImage.image = UIImage(data: data as Data)
//                }
//
//            }
//        }
//        
//        return infoWindow
//    }

    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let infoWindow = Bundle.main.loadNibNamed("MarkerInfoWindow", owner: self, options: nil)?.first! as! MarkerInfoWindow
        
        let dict = marker.userData as? [String:String]
        infoWindow.responseLabel.text = dict?["response"]
       
        let url = URL(string:"http://jeremyjstorer.com/KnoWare/uploadFiles/"+(dict?["image_name"])!)
        
        let data = try! Data(contentsOf: url!)
        infoWindow.responseImage.image = UIImage(data: data)
        
        return infoWindow
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}

extension UIImageView {
    public func imageFromServerURL(_ urlString: String) {
        
        URLSession.shared.dataTask(with: URL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
