//
//  ShareViewController.swift
//  YMoji
//
//  Created by Crane on 9/3/17.
//  Copyright © 2017 GoldITDev. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var ymojiFileName: NSString = ""
    var ymojiFileType: NSString = "sticker"
    var screenSize: CGSize = CGSize()

    @IBOutlet weak var buttonShare: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addToRecent()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addToRecent() {
        
        var recentStickers: Array<String> = []
        if appDelegate.globalUserDefaults?.array(forKey: "recentStickers") != nil {
            recentStickers = appDelegate.globalUserDefaults?.array(forKey: "recentStickers") as! Array<String>
        }
        
        var newRecentStickers: Array<String> = []
        var isAlredyExist: Bool = false
        if recentStickers.count != 0 {
            for index in 0...(recentStickers.count - 1) {
                if ymojiFileName.isEqual(to: recentStickers[index]) {
                    isAlredyExist = true
                }
                
            }
            
            if !isAlredyExist {
                newRecentStickers.append(ymojiFileName as String)
            }
            
            for index in 0...(recentStickers.count - 1) {
                newRecentStickers.append(recentStickers[index])
            }
            
        } else {
            newRecentStickers.append(ymojiFileName as String)
            
        }
        
        appDelegate.globalUserDefaults?.set(newRecentStickers, forKey: "recentStickers")
        appDelegate.globalUserDefaults?.synchronize()
        
    }

    // MARK: -
    // MARK: - Init Interface

    func initUI() {
        
        screenSize = UIScreen.main.bounds.size
        
        if ymojiFileType == "gif" {
            setAnimatedImageView()
        } else {
            setStickerView()
        }
        
    }

    func setAnimatedImageView() {
        
        let gifImage = UIImage.animatedImage(withAnimatedGIFURL: URL(fileURLWithPath: Bundle.main.path(forResource: ymojiFileName as String, ofType: "gif")!))
        let animatedImageView: UIImageView = UIImageView()
        
        let imageWidth = CGFloat((gifImage?.size.width)!)
        let imageHeight = CGFloat((gifImage?.size.height)!)
        
        let gifHeight: CGFloat = CGFloat(buttonShare.frame.origin.y - 95)
        let gifRatio = imageHeight / imageWidth
        
        if gifRatio > 1.0 {
            animatedImageView.frame = CGRect(x: (screenSize.width - gifHeight / gifRatio) / 2, y: 75, width: gifHeight / gifRatio, height: gifHeight)
        } else {
            animatedImageView.frame = CGRect(x: screenSize.width * 0.1, y: (screenSize.height - screenSize.width * 0.8 * gifRatio) / 2, width: screenSize.width * 0.8, height: screenSize.width * 0.8 * gifRatio)
        }
        
        animatedImageView.image = gifImage
        self.view.addSubview(animatedImageView)

    }
    
    func setStickerView() {
        
        let stickerView: UIImageView = UIImageView()
        let sticker = UIImage(named: ymojiFileName as String)
        
        let imageWidth = CGFloat((sticker?.size.width)!)
        let imageHeight = CGFloat((sticker?.size.height)!)
        
        let stickerHeight = CGFloat(buttonShare.frame.origin.y - 155)
        let stickerRatio = imageHeight / imageWidth
        
        if stickerRatio > 1.0 {
            stickerView.frame = CGRect(x: (screenSize.width - stickerHeight / stickerRatio) / 2, y: 105, width: stickerHeight / stickerRatio, height: stickerHeight)
        } else {
            stickerView.frame = CGRect(x: screenSize.width * 0.1, y: (screenSize.height - screenSize.width * 0.8 * stickerRatio) / 2, width: screenSize.width * 0.8, height: screenSize.width * 0.8 * stickerRatio)
        }
        
        stickerView.image = sticker
        self.view.addSubview(stickerView)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: -
    // MARK: - IBActions
    
    @IBAction func actionCancel(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionShare(_ sender: UIButton) {
        
        var items: NSArray = NSArray()
        
        if ymojiFileType == "gif" {
            
            let url = Bundle.main.url(forResource: ymojiFileName as String, withExtension: "gif")
            let data = try? Data(contentsOf: url!)
            items = [data!]
        } else {
            
            items = [UIImage(named: ymojiFileName as String)!]
        }
        
        let controller = UIActivityViewController.init(activityItems: items as [AnyObject], applicationActivities: nil)
        
        self.present(controller, animated: true, completion: nil)
    }
}
