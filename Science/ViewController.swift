//
//  ViewController.swift
//  Science
//
//  Created by Jamone Alexander Kelly on 4/17/15.
//  Copyright (c) 2015 Pixels. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IndoorsSurfaceLocationDelegate, IndoorsSurfaceServiceDelegate {

    var userPosition : IDSCoordinate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Test")
        
        self.title = "Science Center"
        self.navigationController?.title = "Directions"
        
        let IB : IndoorsBuilder = IndoorsBuilder()
        IB.setApiKey("639f54b3-f94f-4ba1-9da5-e59c148456c0")
        IB.setBuildingId(366932298)
        
        let builder = IndoorsSurfaceBuilder(indoorsBuilder: IB, inView: self.view)
        IB.enableEvaluationMode(true)
        
        builder.registerForSurfaceServiceUpdates(self)
        builder.setZoneDisplayMode(IndoorsSurfaceZoneDisplayModeUserCurrentLocation)
        builder.setUserPositionDisplayMode(IndoorsSurfaceUserPositionDisplayModeNone)
        
        builder.build()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildingLoaded(building: IDSBuilding!) {
        println("Unimplemented")
        
        var b = building.floors
        
        
    }
    
    func updateUserPosition(userPosition: IDSCoordinate!) {
        self.userPosition = userPosition
        println("userPosition: x:\(userPosition.x) y:\(userPosition.y) z:\(userPosition.z)")
    }

}

