//
//  ProfileImageViewController.swift
//  UICollectionWithTableView
//


import UIKit

class ProfileImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = image
    }

}
