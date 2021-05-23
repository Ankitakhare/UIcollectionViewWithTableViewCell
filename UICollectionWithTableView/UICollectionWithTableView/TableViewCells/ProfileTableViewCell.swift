//
//  ProfileTableViewCell.swift
//  UICollectionWithTableView
//
//  Created by ankita on 5/20/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

protocol ProfileTableViewCellDelegate: class {
    
    func showProfileDetails(profileData: Profile)
    
}

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    private let profileList = ProfileDataAPI.getProfileList()
    weak var deleagte: ProfileTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}


extension ProfileTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.profileList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell {
            if indexPath.item < self.profileList.count {
                let title = self.profileList[indexPath.item]
                myCell.imageView.image = UIImage(named: title)
                myCell.titleLabel.text = title
                myCell.imageView.layer.cornerRadius = myCell.imageView.frame.size.height / 2.0
            }
            cell = myCell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < self.profileList.count {
            let title = self.profileList[indexPath.item]
            if let profile = ProfileDataAPI.sharedInstance.getProfile(for: title) {
                self.deleagte?.showProfileDetails(profileData: profile)
            }
        }
        
    }
    
}

extension ProfileTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
    
}
