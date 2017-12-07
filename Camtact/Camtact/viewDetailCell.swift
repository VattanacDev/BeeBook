//
//  viewDetailCell.swift
//  Camtact
//
//  Created by Admin on 9/15/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import MapKit
import Spring
import GoogleMaps
class viewDetailCell: UITableViewCell {
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var GmapView: GMSMapView!
    var initLocation = CLLocation(latitude: 11.568995, longitude: 104.890711)
    
    @IBOutlet weak var khmerName: UILabel!
    @IBOutlet weak var englishName: UILabel!
    @IBOutlet weak var ProfileImage: SpringView!
    @IBOutlet weak var ProfilePic: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var websiteBt: UIButton!
    @IBOutlet weak var emailBt: UIButton!
    @IBOutlet weak var phoneBt: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
          profileConfig()
         // setMapLocation(locate: initLocation)
          //  mapView.mapType = .hybridFlyover
       
        
    }
    func profileConfig() {
        ProfileImage.layer.cornerRadius = ProfileImage.frame.size.width / 2
        ProfilePic.layer.cornerRadius = ProfileImage.frame.size.width / 2
        ProfilePic.clipsToBounds = true
        ProfileImage.layer.borderWidth = 1
        ProfileImage.layer.borderColor = UIColor.white.cgColor
        ProfileImage.layer.shadowOffset = CGSize(width: -0.5, height: -0.5)
        ProfileImage.layer.shadowRadius = 1
        ProfileImage.layer.shadowColor = UIColor.black.cgColor
        ProfileImage.layer.shadowOpacity = 0.3
        ProfileImage.animate()
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setMapLocation(locate:CLLocation)  {
        
        let camera = GMSCameraPosition.camera(withTarget: locate.coordinate, zoom: 15.0)
        GmapView.animate(to: camera)
       // let marker = GMSMarker()
        //        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lot)
        //        marker.title = cell.khmerName.text
        //        marker.map = mapView
//        let regionRadius:CLLocationDistance = 300
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(locate.coordinate, regionRadius * 2.0, regionRadius * 2.0)
       // mapView.setRegion(coordinateRegion, animated: true)
       // GmapView.
    }
}
