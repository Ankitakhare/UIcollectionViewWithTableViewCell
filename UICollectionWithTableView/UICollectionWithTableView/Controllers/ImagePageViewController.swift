//
//  ImagePageViewController.swift
//  UICollectionWithTableView
//

import UIKit

protocol ImagePageViewControllerDelegate: class {
    
    func setUpPageController(numberOfPages: Int)
    func changePageController(to index: Int)
    
}

class ImagePageViewController: UIPageViewController {
    
    var images: [UIImage]?
    weak var imagePageViewDelegate: ImagePageViewControllerDelegate?
    
    lazy var controllers: [UIViewController] = {
        
        var controller = [UIViewController]()
        if let images = self.images {
            for image in images {
                if let vc = self.storyboard?.instantiateViewController(identifier: "ProfileImageViewController") as? ProfileImageViewController {
                    //vc.image = image
                    controller.append(vc)
                }
            }
        }
        
        imagePageViewDelegate?.setUpPageController(numberOfPages: controller.count)
        
        return controller
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //UIScrollView.ContentInsetAdjustmentBehavior = false
        //contentInsetAdjustmentBehavior = false
        dataSource = self
        delegate = self
        turnTopage(index: 0)
    }
    
    func turnTopage(index: Int) {
        guard let _ = self.images else {
            
            return
        }
        let controller = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        
        if let currentVC = viewControllers?.first {
            if let currentIndex = controllers.firstIndex(of: currentVC),
                currentIndex > index {
                direction = .reverse
            }
        }
        self.configDisplaying(viewController: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configDisplaying(viewController: UIViewController) {
        for (index, vc) in controllers.enumerated() {
            if viewController == vc {
                if let profileImageVc = viewController as? ProfileImageViewController {
                    profileImageVc.image = self.images?[index]
                    imagePageViewDelegate?.changePageController(to: index)
                }
            }
        }
    }


}

extension ImagePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                
                return controllers[index - 1]
            }
            
        }
        
        return controllers.last
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
}


extension ImagePageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let vc = pendingViewControllers.first as? ProfileImageViewController {
            self.configDisplaying(viewController: vc)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            if let vc = previousViewControllers.first as? ProfileImageViewController {
                self.configDisplaying(viewController: vc)
            }
        }
    }
    
}
