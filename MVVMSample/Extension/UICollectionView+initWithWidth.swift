//
//  UICollectionView+initWithWidth.swift
//  MVVMSample
//
//  Created by 桐山圭祐 on 2017/11/18.
//  Copyright © 2017年 桐山圭祐. All rights reserved.
//

import UIKit

extension UICollectionViewFlowLayout {
    convenience init(itemSize: CGFloat) {
        self.init()
        self.itemSize = CGSize(width: itemSize, height: itemSize)
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
    }
}
