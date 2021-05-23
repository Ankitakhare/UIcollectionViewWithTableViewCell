//
//  ProfileListViewController.swift
//  ProfileApp
//


import UIKit

class ProfileListViewController: UITableViewController {
    
    var profiles: [String] = []
    var categotyTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = categotyTitle?.uppercased()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.profiles.count
    }
    
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileListTableViewCell", for: indexPath) as? ProfileListTableViewCell {
            profileCell.profileName = self.profiles[indexPath.row]
            cell = profileCell
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //We have to go to details from here
    }
}
