//
//  viewDetailVC.swift
//  Camtact
//
//  Created by Admin on 9/14/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
class viewDetailVC: UIViewController,UIPopoverPresentationControllerDelegate,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate{
    var heigt : CGFloat! = 0;
    var con = Contact(id: 1, khName: "កន្លែង", EnName: "location", phone: "010", email: "ho@gmail.com", web: "google.com", locationLL: "11.568569, 104.896911", type: "Hospital", category: "food", description: "11.568569, ", status: true)
    
    @IBOutlet weak var callBt: UIButton!
    @IBOutlet weak var mailBt: UIButton!
    
    @IBOutlet weak var tableDetail: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        callBt.addTarget(self, action: #selector(call(sender:)), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tap = UITapGestureRecognizer(target: self, action: #selector(maptap(sender:)))
        let tapScrollDown = UITapGestureRecognizer(target: self, action: #selector(scrollBT(sender:)))
        let doubleTap = UITapGestureRecognizer(target: self, action:nil)
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        tap.require(toFail: doubleTap)
        tap.delegate = self
        tap.numberOfTapsRequired = 1
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Detail",for: indexPath) as! viewDetailCell
        cell.GmapView.addGestureRecognizer(tap)
        cell.ProfileImage.addGestureRecognizer(tapScrollDown)
        cell.phoneBt.addTarget(self, action: #selector(call(sender:)), for: .touchUpInside)
        print(indexPath.row)
        setDataToDetail(cell: cell, contact: con)
        heigt = labelHeight(label: cell.descriptionLbl)
        return cell
    }
   var isBottom = false
    func scrollBT(sender:UITapGestureRecognizer) {
        //sender.view?.isHidden = true
        
        if !isBottom{
        self.tableDetail.scrollToRow(at:NSIndexPath(row: 0, section: 0) as IndexPath, at: UITableViewScrollPosition.bottom, animated: true)
            isBottom = true
        }else{
            self.tableDetail.scrollToRow(at:NSIndexPath(row: 0, section: 0) as IndexPath, at: UITableViewScrollPosition.top, animated: true)
            isBottom = false
        }
        
    }
    func maptap(sender: UITapGestureRecognizer){
        print("taped map")
        performSegue(withIdentifier: "mapView", sender: nil)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
      {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "Detail") as! viewDetailCell
        print("\n\n",heigt)
        return (800 + heigt)
       }
    //MARK:
    func call (sender:UIButton)
       {
          let cell = tableDetail.dequeueReusableCell(withIdentifier: "Detail") as! viewDetailCell
          print("Calling")
          let phone = URL(string:"telprompt://\("010949388")")
          print(phone)
           // if #available(iOS 10, *){
          UIApplication.shared.open(phone!, options: [:], completionHandler: nil)
        }
    
    func labelHeight(label:UILabel)-> CGFloat
       {
           label.numberOfLines = 0
           label.sizeToFit()
        
         return CGFloat(label.frame.size.height)
       }
    
    func cellConfig(cell:viewDetailCell){
        cell.websiteBt.addTarget(self, action: #selector(webRS(sender:)), for: .touchUpInside)
      }
    
    func webRS(sender:UIButton )  {
        if (sender as! UIButton).title(for: .normal)! != "" {
            performSegue(withIdentifier: "DetailToWeb", sender: sender)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailToWeb"{
            let webController = segue.destination as! WebVC
            webController.Url = (sender as! UIButton).title(for:.normal)!
            //      print(webController.Url,"  5,(sender as! UIButton).title(for: .normal))
        }
    }
    func setDataToDetail(cell:viewDetailCell,contact:Contact) {
        cell.khmerName.text = contact.khName
        cell.englishName.text = contact.EnName
        cell.phoneBt.setTitle(contact.phone, for: .normal)
        cell.emailBt.setTitle(contact.email, for: .normal)
        cell.websiteBt.setTitle(contact.web, for: .normal)
        cell.typeLbl.text = contact.type
        cell.descriptionLbl.text = contact.description
        let stringTk = contact.locationLL.characters.split{$0 == ","}.map(String.init)
        print(stringTk)
        let lat = (stringTk[0] as NSString).doubleValue
        let lot = (stringTk[1] as NSString).doubleValue
        let locationLL =  CLLocation(latitude: lat, longitude: lot)
        setMapLocation(mapView: cell.GmapView, locate: locationLL)
//        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lot, zoom: 16.0)
//        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
//        view.addSubview(mapView)
//
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lot)
//        marker.title = cell.khmerName.text
//        marker.map = mapView
        
    }
    func setMapLocation(mapView:GMSMapView,locate:CLLocation)  {
        
        let mark = GMSMarker(position: locate.coordinate)
        mark.map = mapView
        let camera = GMSCameraPosition.camera(withTarget: locate.coordinate, zoom: 15)
        mapView.animate(to: camera)
//        let regionRadius:CLLocationDistance = 280
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(locate.coordinate, regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
}
