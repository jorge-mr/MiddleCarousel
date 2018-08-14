//
//  ViewController.swift
//  MiddleCarousel
//
//  Created by Jorge MR on 13/08/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let photos = [#imageLiteral(resourceName: "photo1"),#imageLiteral(resourceName: "photo2"),#imageLiteral(resourceName: "photo3"),#imageLiteral(resourceName: "photo4"),#imageLiteral(resourceName: "photo2"),#imageLiteral(resourceName: "photo3"),#imageLiteral(resourceName: "photo4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("scrollViewDidEndDecelerating")
//    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        collectionView.updateInteractiveMovementTargetPosition(CGPoint(x: 0, y: 0))
//        collectionView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 100, height: 100), animated: true)
//        let indexPaths = collectionView.indexPathsForVisibleItems
//        collectionView.scrollToItem(at: indexPaths.last!, at: .centeredHorizontally, animated: true)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + 0
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width * 0.6, height: view.frame.height * 0.5)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! MyCollectionViewCell
        cell.myImageView.image = photos[indexPath.item]
        return cell
    }
    
}

