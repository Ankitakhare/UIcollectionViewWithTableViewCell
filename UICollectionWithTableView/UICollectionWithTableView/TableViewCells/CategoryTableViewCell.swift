//
//  CategoryTableViewCell.swift
//  UICollectionWithTableView
//
//  Created by ankita on 5/20/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

protocol CategoryTableViewCellDelegate: class {
    
    func showProfileList(profileList: [String], for category: String)
    
}

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categoryList = ProfileDataAPI.getProfileCategory()
    weak var delegate: CategoryTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}


extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell {
            if indexPath.item < self.categoryList.count {
                let title = self.categoryList[indexPath.item]
                myCell.imageView.image = UIImage(named: title)
                myCell.titleLabel.text = title
            }
            cell = myCell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < self.categoryList.count {
            let categoryTitle = self.categoryList[indexPath.item]
            let profileList = ProfileDataAPI.sharedInstance.getProfileList(for:categoryTitle.replacingOccurrences(of: " ", with: ""))
            if !profileList.isEmpty {
                self.delegate?.showProfileList(profileList: profileList, for: categoryTitle)
            }
        }
    }
    
}


extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width / 2.0 - 10, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
    
}
