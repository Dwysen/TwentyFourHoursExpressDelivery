//
//  HomeViewController.swift
//  TwentyFourHoursExpress
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 beijingkeji. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let bannerViewHeight:CGFloat = 180
    private let kTitlesViewY: CGFloat = 180 + navigationH
    private let kTitlesViewH:CGFloat = 35
    
    private var currentViewY:CGFloat!
    
    private let kIndicatorViewH: CGFloat = 2.0
    
    private let titleArr = ["最新快递","寄件记录","查询"]
    
    var titlesView = UIView()
    private var indicatorView = UIView()
    private var selectedBtn = UIButton()
    private var contentView = UIScrollView()
    private var claimView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let banner = Banner(frame: CGRect(x: 0, y: navigationH, width: ScreenWidth, height: bannerViewHeight))
        BackScrollView.addSubview(banner)
        view.addSubview(BackScrollView)
        
        addChildVc()
        
        setupTitleView()
        
        setupContentView()
        
//        setupClaimView()
        
        setupBottomView()
        
        
        BackScrollView.contentSize = CGSize(width: ScreenWidth, height: currentViewY )
        BackScrollView.backgroundColor = BackScrollColor()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupBottomView(){
        
        let bottomView = UIView(frame: CGRect(x: 0, y: currentViewY, width: ScreenWidth, height: 225))
        bottomView.backgroundColor = UIColor.white
        
        
        for i in 0..<6 {
            
            let buttonW = ScreenWidth / 2
            let buttonView = HomeButtonView(frame: CGRect(x: CGFloat(i).truncatingRemainder(dividingBy: 2) * buttonW, y: 0, width: ScreenWidth / 2, height: 75))
            
            
            if i > 1
            {
                buttonView.y = 75
                if i > 3
                {
                    buttonView.y = 150
                }
                
            }
              bottomView.addSubview(buttonView)
        }
        
        BackScrollView.addSubview(bottomView)
    
        currentViewY = bottomView.frame.maxY

        
      
        
    }
    
    private func setupClaimView(){
        
        claimView = UIView(frame: CGRect(x: 0, y: currentViewY, width: ScreenWidth, height: 50))
        claimView.backgroundColor = UIColor.white
        let claimIcon = UIImageView(frame: CGRect(x: screenMargin, y: screenMargin, width: 30, height: 30))
        claimIcon.backgroundColor = UIColor.orange
        claimView.addSubview(claimIcon)
        
        let claimTitleLabel = UILabel(frame: CGRect(x: 50, y: screenMargin, width: ScreenWidth - 100, height: 10))
        claimTitleLabel.textAlignment = .left
        claimTitleLabel.text = "一小时先行赔付中心"
       
        claimView.addSubview(claimTitleLabel)
        
        
        let claimSubTitleLabel = UILabel(frame: CGRect(x: 50, y: 30, width: ScreenWidth - 100, height: 10))
        claimSubTitleLabel.textAlignment = .left
        claimSubTitleLabel.text = "一小时先行赔付中心,一小时先行赔付中心,一小时先行赔付中心。"
        claimSubTitleLabel.font = UIFont.systemFont(ofSize: 15)
        claimView.addSubview(claimSubTitleLabel)
        
        let arrowImage = UIImageView(frame: CGRect(x: ScreenWidth - 20, y: 20, width: 10, height: 10))
        arrowImage.image = UIImage(named: "icon_go")
        claimView.addSubview(arrowImage)
        
        BackScrollView.addSubview(claimView)
        
        currentViewY = claimView.y + 50 + screenMargin
        
    }
    
    
    private func addChildVc(){
        
        let vc1 = NewExpressViewController()
        
        addChildViewController(vc1)
        
        let vc2 = ExpressHistoryViewController()
        
        addChildViewController(vc2)
        
        let vc3 = SearchViewController()
        
        addChildViewController(vc3)
        
        
    }
    
    func setupTitleView(){
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: kTitlesViewY, width: ScreenWidth, height: kTitlesViewH)
        BackScrollView.addSubview(bgView)
        
        //标签
        let titlesView = UIView()

        titlesView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: kTitlesViewH)
        titlesView.backgroundColor = UIColor.white
        bgView.addSubview(titlesView)
        
        //底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.red
        indicatorView.height = kIndicatorViewH
        indicatorView.frame.origin.y = kTitlesViewH - kIndicatorViewH
        self.indicatorView = indicatorView
        
        //内部子标签
        
        let count = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count{
            let btn = UIButton()
            btn.height = height
            btn.width = width
            btn.frame.origin.x = CGFloat(index) * width
            btn.tag = index
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.setTitle(titleArr[index], for: UIControlState())
            btn.setTitleColor(UIColor.gray, for: UIControlState())
            btn.setTitleColor(UIColor.red, for: .disabled)
            btn.addTarget(self, action: #selector(titlesClick(_:)), for: .touchUpInside)
            titlesView.addSubview(btn)
            
            //默认点击第一个按钮
            if index == 0 {
                
                btn.isEnabled = false
                selectedBtn = btn
                //让按钮内部的Label根据文字来计算内容, 否则得不到titleLabel的width
                btn.titleLabel?.sizeToFit()
                
                indicatorView.width = btn.titleLabel!.width
                indicatorView.center.x = btn.center.x
            }
        }
        titlesView.addSubview(indicatorView)
        self.titlesView = titlesView
        
    }
    
    func setupContentView(){
        
        automaticallyAdjustsScrollViewInsets = false
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.y = kTitlesViewY + kTitlesViewH
        contentView.delegate = self
        contentView.contentSize = CGSize(width: contentView.width * CGFloat(childViewControllers.count), height: contentView.height)
        
        BackScrollView.insertSubview(contentView, at: 0)
        contentView.isPagingEnabled = true
        self.contentView = contentView
        scrollViewDidEndScrollingAnimation(contentView)
        
        currentViewY = contentView.y + contentViewHeight + screenMargin
        
    }
    
    func titlesClick(_ btn:UIButton) {
        selectedBtn.isEnabled = true
        btn.isEnabled = false
        selectedBtn = btn
        
        UIView.animate(withDuration: 0.25, animations: {
            self.indicatorView.width = self.selectedBtn.titleLabel!.width
            self.indicatorView.center.x = self.selectedBtn.center.x
        })
        
        contentView.setContentOffset(CGPoint(x: CGFloat(btn.tag) * contentView.width, y: 0), animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate lazy var BackScrollView:UIScrollView = {
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - tabbarH))
        
        scrollView.isScrollEnabled = true
        return scrollView
        
    }()
    
}

extension HomeViewController:UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        let vc = childViewControllers[index]
        
        vc.view.frame.origin.x = scrollView.contentOffset.x
        //设置控制器的Y为0，默认为20
        vc.view.frame.origin.y = 0
        
        scrollView.addSubview(vc.view)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 点击 Button
        let button = titlesView.subviews[index] as! UIButton
        titlesClick(button)
    }
    
}

