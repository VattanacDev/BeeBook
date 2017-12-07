//
//  mainCell.swift
//  Camtact
//
//  Created by Admin on 9/14/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import Spring

class mainCell: UITableViewCell {

    @IBOutlet weak var rowIcon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var enName: UILabel!
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var locat: UILabel!
    
    @IBOutlet weak var ContentView: UIView!
    
    @IBOutlet weak var containerView: SpringView!
    override func awakeFromNib() {
        super.awakeFromNib()
        rowConfig()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func rowConfig() {
        rowIcon.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width:1,height:1)
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowOpacity = 1
        
        rowIcon.layer.cornerRadius = rowIcon.frame.size.height / 2
        rowIcon.layer.borderWidth = 2
        rowIcon.layer.borderColor = UIColor(patternImage: #imageLiteral(resourceName: "blur1")).cgColor
       }
    
}
