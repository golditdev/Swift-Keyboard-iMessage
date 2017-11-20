//
//  YMojiKeyboardCollectionViewLayout.swift
//  YMoji
//
//  Created by Crane on 9/8/17.
//  Copyright © 2017 GoldITDev. All rights reserved.
//

import UIKit

protocol YMojiKeyboardCollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, widthForPhotoAtIndexPath indexPath: IndexPath, withHeight height: CGFloat) -> CGFloat
}

class YMojiKeyboardCollectionViewLayout: UICollectionViewFlowLayout {

    var delegate: YMojiKeyboardCollectionViewLayoutDelegate!
    
    var numberOfRows = 2
    var cellPadding: CGFloat = 0.0
    
    var cache = [YMojiKeyboardCollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat = 0.0
    fileprivate var contentHeight: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.height - (insets.top + insets.bottom)
    }
    
    override func prepare() {
        if !cache.isEmpty {
            cache.removeAll()
        }
        
        let columnHeight = contentHeight / CGFloat(numberOfRows)
        var yOffset = [CGFloat]()
        for column in 0 ..< numberOfRows {
            yOffset.append(CGFloat(column) * columnHeight)
        }
        
        var column = 0
        var xOffset = [CGFloat](repeating: 0, count: numberOfRows)
        
        for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let height = columnHeight - cellPadding * 2
            let photoWidth = delegate.collectionView(collectionView!, widthForPhotoAtIndexPath: indexPath, withHeight: height)
            let width = cellPadding + photoWidth + cellPadding
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: width, height: columnHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = YMojiKeyboardCollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.photoWidth = photoWidth
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentWidth = max(contentWidth, frame.maxX)
            xOffset[column] = xOffset[column] + width
            column = column >= (numberOfRows - 1) ? 0 : (column + 1)
        }
        
    }
    
    override var collectionViewContentSize : CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        
        return layoutAttributes
    }
    
    override class var layoutAttributesClass : AnyClass {
        return YMojiKeyboardCollectionViewLayoutAttributes.self
    }

}

class YMojiKeyboardCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var photoWidth: CGFloat = 0.0
    
    override func copy(with zone: NSZone?) -> Any {
        let copy = super.copy(with: zone) as! YMojiKeyboardCollectionViewLayoutAttributes
        copy.photoWidth = photoWidth
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attribute = object as? YMojiKeyboardCollectionViewLayoutAttributes {
            if attribute.photoWidth == photoWidth {
                return super.isEqual(object)
            }
        }
        
        return false
    }
    
}

