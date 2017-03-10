import UIKit

class Banner: UIView{

    //图像数组，暂时用颜色代替
    let images = [UIColor.blue,UIColor.black,UIColor.cyan]
    
    var CollectionView: UICollectionView?
    var flowlayout = UICollectionViewFlowLayout()
    var pageControl = UIPageControl()
    var timer = Timer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubviews(frame: frame)
     
    }
    
    func createSubviews(frame: CGRect){
        CollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            , collectionViewLayout: flowlayout)
        flowlayout.itemSize = CGSize(width:frame.size.width, height:frame.size.height)
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.minimumLineSpacing = 0;
        flowlayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        CollectionView!.backgroundColor = UIColor.lightGray
        CollectionView!.isPagingEnabled = true
        CollectionView!.dataSource  = self
        CollectionView!.delegate = self
        CollectionView!.showsHorizontalScrollIndicator = false
        CollectionView!.showsVerticalScrollIndicator = false
        CollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(CollectionView!)
        pageControl = UIPageControl.init(frame: CGRect(x:0,y: 0,width:frame.size.width / 2,height:30))
        pageControl.center = CGPoint(x:frame.size.width / 2, y:frame.size.height - 20);
        self.addSubview(pageControl);
        
        self.addTimer()
    }
    
    func addTimer(){
        let timer1 = Timer.init(timeInterval: 8, target: self, selector: #selector(nextPageView), userInfo: nil, repeats: true)
        RunLoop.current.add(timer1, forMode: RunLoopMode.commonModes)
        timer = timer1
    }
    
    func nextPageView(){
        
        let indexPath = self.CollectionView!.indexPathsForVisibleItems.last
        var item = (indexPath?.item)! + 1;
        var section = indexPath!.section;
        //滑动到最后一个item的时候，下一个变为下一Section的第一个
        if item == images.count {
            item = 0
            section += 1
        }
        if section == 99 {
        timer.invalidate()
        }
        self.pageControl.currentPage = item;
        let nextIndexPath = IndexPath(row: item, section: section)
      
        CollectionView!.scrollToItem(at: nextIndexPath, at: UICollectionViewScrollPosition.left, animated: true)
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Banner:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = CollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if cell == nil{
     
        }
        let colorArr = [UIColor.blue,UIColor.black,UIColor.cyan]
        cell?.backgroundColor = colorArr[indexPath.row]
        return cell!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
      
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
}
