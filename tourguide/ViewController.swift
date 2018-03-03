//
//  ViewController.swift
//  tourguide
//
//  Created by Kevin Fang on 3/3/18.
//  Copyright © 2018 Kevin Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var maxDistanceField: UITextField!
    @IBOutlet weak var maxTimeField: UITextField!
    @IBOutlet weak var transportationField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sendRequest(){
        var maxDistance = maxDistanceField.text!
        var maxTime = maxTimeField.text!
        var routeMode = transportationField.text!
        
        var url = "https://api.labs.cognitive.microsoft.com/BingMaps/NavJoin?startPoint={startPoint}&routeMode=routeModemaxDistance=maxDistance&maxTime=maxTime&departTime=departTime"

    }


}

