//
//  MapVC.swift
//  Camtact
//
//  Created by Admin on 9/23/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let initLocation = CLLocation(latitude: 11.568995, longitude: 104.890711)
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapLocation(locate: initLocation)
        mapView.mapType = .hybridFlyover
        navigationConfig()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func navigationConfig() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "blackBg"), for: .default)
        self.navigationController?.navigationBar.alpha = 0.98
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
      self.navigationController?.navigationBar.frame =  CGRect(x:0 , y: 410, width:300, height: 40)
    }

    func setMapLocation(locate:CLLocation)  {
        let regionRadius:CLLocationDistance = 300
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(locate.coordinate, regionRadius * 2.0, regionRadius * 2.0)
          //  mapView.setRegion(coordinateRegion, animated: true)
    }
}
