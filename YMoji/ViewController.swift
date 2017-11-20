//
//  ViewController.swift
//  YMoji
//
//  Created by Crane on 9/3/17.
//  Copyright © 2017 GoldITDev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, YMojiCollectionViewLayoutDelegate {

    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var ymojiArray: NSMutableArray = NSMutableArray()
    var ymojiCollectionView: UICollectionView!
    
    @IBOutlet weak var ymojiContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadYMojies()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: -
    // MARK: - Init Interface
    
    func loadYMojies () {
        
        for item in 0...appDelegate.ymojiCount {
            ymojiArray.add("minion\(item)")
        }
    }
    
    func createCollectionView() {
        
        ymojiCollectionView = createYMojiCollectionView(CGRect(x: 0, y: 0, width: ymojiContainerView.frame.size.width, height: ymojiContainerView.frame.size.height), tag: 0)
        
        ymojiContainerView.addSubview(ymojiCollectionView)
        ymojiCollectionView.reloadData()
        
    }
    
    func createYMojiCollectionView(_ rect: CGRect, tag: Int) -> UICollectionView {
        
        let pinsCollectionViewLayout: YMojiCollectionViewLayout = YMojiCollectionViewLayout()
        pinsCollectionViewLayout.cellPadding = 5
        pinsCollectionViewLayout.delegate = self
        pinsCollectionViewLayout.numberOfColumns = 3
        
        let collectionView: UICollectionView = UICollectionView(frame: rect, collectionViewLayout: pinsCollectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.tag = tag
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        
        let nibName = UINib(nibName: "YMojiCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nibName, forCellWithReuseIdentifier: "YMojiCollectionViewCell")
        
        return collectionView
    }
    
    
    // MARK: -
    // MARK: - Emoji CollectionView DataSoruce & Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return ymojiArray.count
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YMojiCollectionViewCell", for: indexPath) as! YMojiCollectionViewCell
        let fileName = ymojiArray.object(at: (indexPath as NSIndexPath).row) as! String
        
        if fileName == "minion5" || fileName == "minion9" || fileName == "minion14" {
            
            cell.containerImageView.image = UIImage.animatedImage(withAnimatedGIFURL: URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: "gif")!))
        } else {
            
            cell.containerImageView.image = UIImage(named: fileName)
        }
        cell.layoutIfNeeded()
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        
        var ratio: CGFloat = 1.0
        var imageWidth: CGFloat = 0.0
        var imageHeight: CGFloat = 0.0
        
        var image: UIImage = UIImage()
        
        let fileName = ymojiArray.object(at: (indexPath as NSIndexPath).row) as! String

        if fileName == "minion5" || fileName == "minion9" || fileName == "minion14" {
            
            image = UIImage.animatedImage(withAnimatedGIFURL: URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: "gif")!))
        } else {
            
            image = UIImage(named: fileName)!
        }

        
        imageWidth = CGFloat(image.size.width)
        imageHeight = CGFloat(image.size.height)
        
        ratio = imageHeight / imageWidth
        let size = CGSize(width: 100, height: 100 * ratio)
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect = AVMakeRect(aspectRatio: size, insideRect: boundingRect)
        
        return rect.height
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "ShareViewController") as! ShareViewController
        let fileName = ymojiArray.object(at: (indexPath as NSIndexPath).row) as! String
        nextViewController.ymojiFileName = fileName as NSString
        
        if fileName == "minion5" || fileName == "minion9" || fileName == "minion14" {
            nextViewController.ymojiFileType = "gif"
        }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    
    // MARK: -
    // MARK: - IBActions
    
    @IBAction func actionRecent(_ sender: UIButton) {
        
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "RecentViewController") as! RecentViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func actionSetting(_ sender: UIButton) {
        
        let nextViewController = self.storyboard!.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

}

