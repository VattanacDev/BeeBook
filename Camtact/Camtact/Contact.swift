//
//  Contact.swift
//  Camtact
//
//  Created by Admin on 9/24/17.
//  Copyright © 2017 CKCC. All rights reserved.
//
import UIKit

class Contact {
    var id :Int
    var khName:String
    var EnName:String
    var phone:String
    var email:String
    var web:String
    var locationLL:String
    var type:String
    var category:String
    var description:String
    var status:Bool
    init(id:Int,khName:String,EnName:String,phone:String,email:String,web:String,locationLL:String,type:String,category:String,description:String,status:Bool) {
         self.id = id
         self.khName = khName
         self.EnName = EnName
         self.phone = phone
         self.email = email
         self.web = web
         self.locationLL = locationLL
         self.type = type
         self.category = category
         self.description = description
         self.status = status
        
    }
 
  
}
