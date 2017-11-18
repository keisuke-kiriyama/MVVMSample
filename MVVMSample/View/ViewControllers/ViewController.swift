//
//  ViewController.swift
//  MVVMSample
//
//  Created by 桐山圭祐 on 2017/11/18.
//  Copyright © 2017年 桐山圭祐. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    
    let viewModel: ViewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        let cellWidth = self.view.frame.width / 3
        let layout = UICollectionViewFlowLayout(itemSize: cellWidth)
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Reload")
        self.collectionView.addSubview(self.refreshControl)
        
        // MARK: From ViewModel
        
        viewModel.models.asDriver().drive(onNext: { _ -> Void in
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        }).disposed(by: self.disposeBag)
        
        // MARK: To ViewModel
        
        self.refreshControl.rx.controlEvent(.valueChanged).asDriver().drive(onNext: {
            self.viewModel.reloadData()
        }).disposed(by: self.disposeBag)
        
        self.viewModel.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageURL = viewModel.urls[indexPath.row]
        return cell
    }
    
}
