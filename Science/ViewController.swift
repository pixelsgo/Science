//
//  ViewController.swift
//  Science
//
//  Created by Jamone Alexander Kelly on 4/17/15.
//  Copyright (c) 2015 Pixels. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IndoorsSurfaceLocationDelegate, IndoorsSurfaceServiceDelegate
//, IndoorsSurfaceViewDelegate 
{
    let indoors = Indoors.instance()
    var surfaceBuilder : IndoorsSurfaceBuilder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Science Center"
        self.navigationController?.title = "Directions"
        
        var IB : IndoorsBuilder = IndoorsBuilder()
        IB.setApiKey("639f54b3-f94f-4ba1-9da5-e59c148456c0")
        IB.setBuildingId(366932298)
        
    
        surfaceBuilder = IndoorsSurfaceBuilder(indoorsBuilder: IB, inView: self.view)
        IB.enableEvaluationMode(true)
        
        surfaceBuilder.registerForSurfaceServiceUpdates(self)
        surfaceBuilder.setZoneDisplayMode(IndoorsSurfaceZoneDisplayModeUserCurrentLocation)
        surfaceBuilder.setUserPositionDisplayMode(IndoorsSurfaceUserPositionDisplayModeDefault)
        
        surfaceBuilder.indoorsSurface.routeSnappingEnabled = true
        surfaceBuilder.build()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*
    override func loadView() {
        var IS : ISIndoorsSurface = ISIndoorsSurface()
    
        IS.enableAutomaticFloorSelection = true
        IS.delegate = self
        self.view = IS
    }
    */
    
    func connected() {
        surfaceBuilder.registerForSurfaceLocationUpdates(self)
        
        //Indoors.registerLocationListener(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildingLoaded(building: IDSBuilding!) {
        println("Unimplemented")
        
        
    }
    
    func updateUserPosition(userPosition: IDSCoordinate!) {
        
        //println("userPosition: x:\(userPosition.x) y:\(userPosition.y) z:\(userPosition.z)")
    }
    
    

}

