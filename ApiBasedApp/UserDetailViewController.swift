//
//  UserDetailViewController.swift
//  ApiBasedApp
//
//  Created by Namrata on 15/07/2019.
//  Copyright © 2019 Namrata. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    var user: UserInformation?
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var lagreImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
  
    func setupView(){
        
        let data = try? Data.init(contentsOf: URL(string: user!.picture.large)!)
        lagreImage?.image = UIImage(data: data!)
        userNameLabel.text = formatName(userName: user!.name)
        emailLabel.text = user?.email
        phoneLabel.text = contactDetails(cell: user!.cell, phone: user!.phone)
        addressLabel.text = formatAddress(location: user!.location)
    }
    
    func formatName(userName: UserName)-> String{
        return userName.title.capitalized + " " + userName.first.capitalized + " " + userName.last.uppercased()
    }
    
    func contactDetails(cell: String, phone: String)-> String{
    return cell + " / " + phone
    }
    func formatAddress(location: Location)-> String{
        return location.street+", "+location.city+", "+location.state
    }
}
