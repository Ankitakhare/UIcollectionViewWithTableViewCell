//
//  ProfileDetailViewController.swift
//  UICollectionWithTableView
//
//  Created by ankita on 5/23/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {
    
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var profileTextView: UITextView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    var profile: Profile?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = profile?.name ?? ""
        self.profileTextView.text = profile?.biography ?? ""
    }
    
    @IBAction func actionOpenTwitter(_ sender: UIButton) {
        if let twitterTag = self.profile?.twitter, !twitterTag.isEmpty {
            if let url = URL(string: "https://twitter.com/\(twitterTag)"),
            UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ImagePageViewController" {
            if let imageController = segue.destination as? ImagePageViewController {
                imageController.imagePageViewDelegate = self
                if let name = self.profile?.name {
                    imageController.images = ProfileDataAPI.sharedInstance.getProfileImages(name: name)
                    self.imagePageControl.isHidden = imageController.images?.isEmpty ?? true
                }
            }
            
        }
    }

}

extension ProfileDetailViewController: ImagePageViewControllerDelegate {
    
    func setUpPageController(numberOfPages: Int) {
        self.imagePageControl.numberOfPages = numberOfPages
    }
    
    func changePageController(to index: Int) {
        self.imagePageControl.currentPage = index
    }
}
