//
//  ViewController.swift
//  ApiBasedApp
//
//  Created by Namrata on 05/06/2019.
//  Copyright © 2019 Namrata. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var userArray: [UserInformation]?
    var selectedUser:UserInformation?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
  
    func fetchUser(){
        var request = URLRequest(url: URL(string:"https://randomuser.me/api/?results=50&seed=SUPE")!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(RandomUser.self, from: data!)
                self.userArray = responseModel.results

                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
               
            }catch let error{
                print("JSON serialization error: ", error)
            }
            }.resume()
        
        
    }
    
    func formatName(userName: UserName)-> String{
        return userName.first.capitalized + " " + userName.last.uppercased()
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let userdetailViewController = segue.destination as? UserDetailViewController else {
            return
        }
        userdetailViewController.user = selectedUser
    }

}


extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserPrototypeCell") as? UserTableViewCell else{
            return UITableViewCell()
        }
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.white
        }
        else
        {
            cell.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.3, blue: 0.6, alpha: 0.1)
        }
        if let user = userArray?[indexPath.row]{
            let fullname = formatName(userName: user.name)
            cell.UserNameLabel?.text = fullname
            cell.EmailLabel?.text = user.email
            cell.UImageView.layer.cornerRadius = 25;
            let data = try? Data.init(contentsOf: URL(string: user.picture.thumbnail)!)
            cell.UImageView?.image = UIImage(data: data!)
        }
        return cell
    }
    
    
}


extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = userArray?[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


