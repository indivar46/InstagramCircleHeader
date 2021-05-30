//
//  ViewController.swift
//  InstaHeader
//
//  Created by Indivar on 29/05/21.
//  Copyright © 2021 Indivar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progssBar: UIProgressView!
    var arrImageData = [ModelImage]()
    @IBOutlet weak var imgVwStory: UIImageView!
    @IBOutlet weak var viewPopUp: UIView!
    @IBOutlet weak var collectnVw: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellnib = UINib(nibName: "ItemCell", bundle: nil)
        collectnVw.register(cellnib, forCellWithReuseIdentifier:"ItemCell" )
        addStoryData()
        progssBar.progress = 0.0
        // Do any additional setup after loading the view.
    }
    
    //MARK: Set static Data , replace here when api integrated
    func addStoryData()
    {
        let modImg = ModelImage()
        modImg.strImage = "img1.jpeg"
        arrImageData.append(modImg)
        
        let modImg2 = ModelImage()
        modImg2.strImage = "img2.jpeg"
        arrImageData.append(modImg2)
        
        
        let modImg3 = ModelImage()
        modImg3.strImage = "img3.jpeg"
        arrImageData.append(modImg3)
        
        let modImg4 = ModelImage()
        modImg4.strImage = "img4.jpeg"
        arrImageData.append(modImg4)

        let modImg5 = ModelImage()
        modImg5.strImage = "img5.jpeg"
        arrImageData.append(modImg5)

        
    }
    //MARK: set ProgressBar here , change time interval value to as per requirements
    func setProgress(_ mod: ModelImage)
    {
        let timeInterVal = 3.0
        imgVwStory.image = UIImage(named:mod.strImage)
        viewPopUp.isHidden = false
        self.progssBar.layer.sublayers?.forEach { $0.removeAllAnimations() }
        UIView.animate(withDuration: 0.0, animations: {
               self.progssBar.layoutIfNeeded()
           }, completion: { finished in
               self.progssBar.progress = 1.0

            UIView.animate(withDuration: timeInterVal, delay: 0.0, options: [.curveLinear], animations: {
                   self.progssBar.layoutIfNeeded()
               }, completion: { finished in
                DispatchQueue.main.async {
                    mod.isSelected = true
                    self.progssBar.progress = 0.0
                    self.collectnVw.reloadData()
                     self.viewPopUp.isHidden = true

                }
               
                
               })
           })
}
    


}

//MARK: Collection View Data Source and Delegate

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath as IndexPath) as? ItemCell
        
        let mod = arrImageData[indexPath.row]
        cell?.photoModal = mod

        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var mod = ModelImage()
        mod = arrImageData[indexPath.item]
        setProgress(mod)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     //   return CGSize(width: collectionView.bounds.width/3.0, height: collectionView.bounds.width/3.0)
        
        return CGSize(width: 80, height: 80)

    }
}
