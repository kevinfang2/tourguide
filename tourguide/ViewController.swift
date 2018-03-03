//
//  ViewController.swift
//  tourguide
//
//  Created by Kevin Fang on 3/3/18.
//  Copyright © 2018 Kevin Fang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var maxDistanceField: UITextField!
    @IBOutlet weak var maxTimeField: UITextField!
    @IBOutlet weak var transportationField: UITextField!
    
    let locationManager = CLLocationManager()

    @IBAction func startRoute(_ sender: Any) {
        sendRequest()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendRequest(){
        let maxDistance = maxDistanceField.text!
        let maxTime = maxTimeField.text!
        let routeMode = transportationField.text!
        guard let locValue: CLLocationCoordinate2D = self.locationManager.location?.coordinate else { return }
        let lat = String(locValue.latitude)
        let long = String(locValue.longitude)
        let startPoint = lat + ", " + long
        
        let url = "https://api.labs.cognitive.microsoft.com/BingMaps/NavJoin?startPoint=" + startPoint + "&categoryIds=90265&routeMode=" + routeMode + "&maxDistance=" + maxDistance + "&maxTime=" + maxTime + "&departTime=departTime"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("e7db921997ca41d8aedf1b339e3bd181", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            print("Entered the completionHandler")
            print (data)
            }.resume()
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }

}

