//
//  ViewController.swift
//  WeatherMate
//
//  Created by Qingzhou Wang on 7/5/19.
//  Copyright © 2019 Qingzhou Wang. All rights reserved.
//

import UIKit
import WM_API

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let request = WMAPI.Weather.GetCurrentWeather.Request(id: "2172797")
        APIClient.default.makeRequest(request) { response in
            print(response)
        }
    }
}
