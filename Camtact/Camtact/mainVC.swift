//
//  mainVC.swift
//  Camtact
//
//  Created by Student on 9/13/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import ContactsUI

class mainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate, CNContactPickerDelegate{
    
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.light))
    
    var CONTACTS = [Contact]()
    var HospitalArray = [Contact]()
    var PoliceArray = [Contact]()
    
    func request(url:String) {
        let Url = URL(string:url)
        print("request", Url)
        
       let task = URLSession.shared.dataTask(with: Url!) { (data, respond, error) in
            guard error == nil else {
                return
            }
         self.diserialize(data: data!)
            
        }
        task.resume()
        
        
    }
    func  diserialize(data:Data)-> [Contact]{
        let jsons = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
        var contacts = [Contact]()
        
         for json in jsons{
            let contactDic = json as! [String:Any]
            let id  = contactDic["_con_id"] as! Int
            let khName = contactDic["_con_kh_name"] as! String
            let EnName = contactDic["_con_name"] as! String
            let phone = contactDic["_con_phone"] as! String
            let email = contactDic["_con_mail"] as! String
            let web = contactDic["_con_web"] as! String
            let locationLL = contactDic["_con_latlng"] as! String
            let type = contactDic["_con_type"] as! String
            let category = contactDic["_con_cate"] as! String
            let description = contactDic["_con_desc"] as! String
            let status = contactDic["_con_status"] as! Bool

            let cont = Contact(id: id, khName: khName, EnName: EnName, phone: phone, email: email, web: web, locationLL: locationLL, type: type, category: category, description: description, status: status)
            if category == "Hospital" {
               
                HospitalArray.append(cont)
            }
            else if category == "Police" {
                PoliceArray.append(cont)
            }
           
            //contacts.append(cont)
        }
        self.CONTACTS = HospitalArray
        //print(contacts)
        DispatchQueue.main.async {
            self.table.reloadData()
        }
        return contacts
    }
    @IBOutlet weak var table: UITableView!
  
    //View DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request(url: "http://localhost:8888/beebook/public/read/emergency")
        table.delegate = self
        table.dataSource = self
        table.contentInset.top = 10
        table.contentInset.bottom = 55
        table.backgroundColor = UIColor.clear
        
        //Blur Background
        blurView.frame = self.view.bounds
        blurView.alpha = 0.92
        let tableBg = UIImageView(frame: self.view.frame)
        tableBg.image = #imageLiteral(resourceName: "ww")
        let blurBg = UIVisualEffectView(effect:UIBlurEffect(style: UIBlurEffectStyle.light))
        blurBg.alpha = 0.8
        blurBg.frame = self.view.frame
        self.view.addSubview(tableBg)
        self.view.addSubview(blurBg)
        self.view.addSubview(table)
       
        
        
    }
    @IBAction func OpenContact(_ sender: Any) {
        print("\"Open Contact List\"")
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
            }
        }
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel Contact Picker")
    }
    @IBAction func SwitchEmergency(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("Hospital seg")
            self.CONTACTS = HospitalArray
            self.table.reloadData()
            //self.CONTACTS = PoliceArray
        }
        else{
            print("Polic seg")
            //self.CONTACTS.removeAll()
            self.CONTACTS = PoliceArray
            self.table.reloadData()
           // self.CONTACTS = HospitalArray
        }
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let call = UITableViewRowAction(style: .default, title: "Call") { (action, indexPath) in
            
            
        }
        call.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.231372549, alpha: 1)
        
        let Map = UITableViewRowAction(style: .normal, title: "Map") { (Action, index) in
        
        }
        
        
        return [call,Map]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! mainCell
        setDataToRow(cell: cell, contact: CONTACTS[indexPath.row])
        return cell
    }
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        blurView.removeFromSuperview()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CONTACTS.count
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationCofig()
        //blurView.removeFromSuperview()
    }
    

    func navigationCofig() {
       
    self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9935732484, green: 0.7895584702, blue: 0.01478145923, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! mainCell
        cell.containerView.animate()
        performSegue(withIdentifier: "mainToDetail", sender: CONTACTS[indexPath.row])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToDetail"{
        
        let pop = segue.destination
        let viewdetailVC = pop.childViewControllers[0] as! viewDetailVC
            //pass data
            viewdetailVC.con = sender as! Contact
            //popoverCofig
            pop.modalPresentationStyle = .popover
            let point = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
            pop.popoverPresentationController?.sourceView = self.view
            pop.popoverPresentationController?.sourceRect = CGRect(origin: point, size: CGSize.zero)
            
            pop.popoverPresentationController?.permittedArrowDirections = .init(rawValue: 0)
            
            pop.popoverPresentationController?.delegate = self
           // pop.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            self.view.addSubview(blurView)
            self.blurView.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
            self.blurView.alpha = 0
            
//            viewdetailVC.view.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
//            viewdetailVC.view.alpha = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.blurView.alpha = 0.92
                self.blurView.transform = CGAffineTransform.identity
                
            })
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func setDataToRow(cell:mainCell,contact:Contact) {
        
        if contact.category == "Hospital" {
         cell.rowIcon.image = #imageLiteral(resourceName: "doctor")
        }
        else {
         cell.rowIcon.image = #imageLiteral(resourceName: "police")
        }
        cell.name.text = contact.khName
        cell.enName.text = contact.EnName
        cell.tel.text = contact.phone
        cell.locat.text = contact.locationLL
        let stringTk = contact.locationLL.characters.split{$0 == ","}.map(String.init)
        print(stringTk)
        let lat = (stringTk[0] as NSString).doubleValue
        let lot = (stringTk[1] as NSString).doubleValue
        let locationLL =  CLLocation(latitude: lat, longitude: lot)
        CLGeocoder().reverseGeocodeLocation(locationLL) { (placeMark, error) in
           
            if let city = placeMark?[0].addressDictionary?["Name"] as? NSString {
                if let country = placeMark?[0].addressDictionary?["Country"] {
                    
              
                print(city)
                cell.locat.text = "\(city as String), \(country)"
                }
            }
        }
    }
}