
import UIKit

class HeadTopView: UIView {
   
//    lazy var bgView:UIView = {
//        let bgView = UIView()
//        bgView.backgroundColor = TFColor(255, g: 255, b: 255, a: 0)
//        return bgView
//    }()
    
    lazy var noticeBtn:UIButton = {
        let noticeBtn = UIButton()
        noticeBtn.setImage(UIImage(named: "Me_message_20x20_"), for: UIControlState())
        return noticeBtn
    }()
    
    /// 懒加载，创建左上角消息按钮
    lazy var settingButton: UIButton = {
        let settingButton = UIButton()
        settingButton.setImage(UIImage(named: "Me_settings_20x20_"), for: UIControlState())
        return settingButton
    }()
    
    /// 懒加载，创建头像按钮
    lazy var iconButton: UIButton = {
        let iconButton = UIButton()
        iconButton.setBackgroundImage(UIImage(named: "Me_AvatarPlaceholder_75x75_"), for: UIControlState())
        iconButton.layer.cornerRadius = iconButton.width * 0.5
        iconButton.layer.masksToBounds = true
        return iconButton
    }()
    
    /// 懒加载，创建昵称标签
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "点击登录"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 15.0)
        nameLabel.textAlignment = .center
        return nameLabel
    }()

    
    override init(frame: CGRect) {
    super.init(frame: frame)

//       addSubview(bgView)
        addSubview(settingButton)
        addSubview(noticeBtn)
        addSubview(iconButton)
        addSubview(nameLabel)
        
//        bgView.frame = frame
        
        // bgView需覆盖顶部状态栏，状态栏高20
//        bgView.height = frame.height 
        
        noticeBtn.frame = CGRect(x: 0, y: 20, width: 44, height: 44)
        settingButton.frame = CGRect(x: ScreenWidth - 44, y: 20, width: 44, height: 44)
        iconButton.frame = CGRect(x: ScreenWidth / 2 - 30, y: 80, width: 60 , height: 60)
        nameLabel.frame = CGRect(x: ScreenWidth / 2 - 60 , y: 150, width: 120, height: 20)
        
        backgroundColor = GreenColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
