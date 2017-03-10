//
//  NewExpressViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class NewExpressViewController: UIViewController {

    private var BackgroundImageView:UIImageView!
    private var BackgroundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: contentViewHeight)
        view.backgroundColor = UIColor.white
        BackgroundImageView = UIImageView(frame:CGRect(x: ScreenWidth / 2 - 50, y: 20, width: 100, height: 100))
        BackgroundImageView.image = UIImage(named: "NewExpressBackground")
        view.addSubview(BackgroundImageView)
        
        BackgroundLabel = UILabel(frame: CGRect(x: 10, y: 120, width: ScreenWidth - 20, height: 20))
        BackgroundLabel.textAlignment = .center
        BackgroundLabel.font = UIFont.systemFont(ofSize: 13)
        BackgroundLabel.textColor = TFColor(85, g: 85, b: 85, a: 1)
        BackgroundLabel.text = "无最新寄出的快递和收到的快递"
        view.addSubview(BackgroundLabel)
        
        BackgroundImageView.isHidden = true
        BackgroundLabel.isHidden = true
        
        setupCollectionView()
   
        // Do any additional setup after loading the view.
    }

    func setupCollectionView(){
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: contentViewHeight),collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ExpressCell.self, forCellWithReuseIdentifier: "ExpressCell")
//        self.collectionView = collectionView 
        view.addSubview(collectionView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension NewExpressViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpressCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (ScreenWidth - 10), height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
}

