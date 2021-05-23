//
//  ViewController.swift
//  UICollectionWithTableView
//

//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        self.tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            if let myCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell {
                myCell.deleagte = self
                cell = myCell
            }
            
        } else {
            if let myCell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell {
                myCell.delegate = self
                cell = myCell
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            
            return 215.0
        }
        
        return tableView.bounds.size.height - 215.0
    }
  

}


extension ViewController: ProfileTableViewCellDelegate {
    
    func showProfileDetails(profileData: Profile) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "ProfileDetailViewController") as? ProfileDetailViewController {
            vc.profile = profileData
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: CategoryTableViewCellDelegate {
    
    func showProfileList(profileList: [String], for category: String) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "ProfileListViewController") as? ProfileListViewController {
            vc.profiles = profileList
            vc.categotyTitle = category
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
