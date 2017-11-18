//
//  CollectionViewCell.swift
//  MVVMSample
//
//  Created by 桐山圭祐 on 2017/11/18.
//  Copyright © 2017年 桐山圭祐. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    var imageURL: URL? {
        didSet{
            self.imageView.kf.setImage(with: imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupConstraints(view: self.imageView)
        self.addSubview(self.imageView)
    }
    
}
