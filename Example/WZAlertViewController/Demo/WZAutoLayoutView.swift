//
//  WZAutoLayoutView.swift
//  WZAlertViewController_Example
//
//  Created by xiaobin liu on 2019/8/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import WZAlertViewController

class WZAutoLayoutView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let temLabel = UILabel()
        temLabel.text = "文本"
        temLabel.backgroundColor = UIColor.red
        temLabel.textColor = UIColor.white
        temLabel.textAlignment = .center
        return temLabel
    }()
    
    /// 布局高度
    internal var layoutConstraintHeight: NSLayoutConstraint?
    
    /// 安全区域距离底部
    private lazy var safeAreaInsetsBottom: CGFloat = {
        
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.rootViewController?.view.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }()
    
    var isUpdate = false
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        configView()
        configLocation()
    }
    
    private func configView() {
        addSubview(titleLabel)
    }
    
    private func configLocation() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -safeAreaInsetsBottom).isActive = true
        layoutConstraintHeight = titleLabel.heightAnchor.constraint(equalToConstant: 200)
        layoutConstraintHeight?.isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
//        guard let temView = self.superview as? WZShowAlertView else {
//            return
//        }
//        temView.beginUpdateLayout()
//        layoutConstraintHeight?.isActive = false
//        if !isUpdate {
//            layoutConstraintHeight = titleLabel.heightAnchor.constraint(equalToConstant: 300)
//        } else {
//            layoutConstraintHeight = titleLabel.heightAnchor.constraint(equalToConstant: 200)
//        }
//        layoutConstraintHeight?.isActive = true
//        temView.updateLayout()
//        isUpdate = !isUpdate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - WZShowActionSheetViewDelegate
extension WZAutoLayoutView: WZShowAlertViewDelegate {
    
    func actionSheetWillShow(_ sheet: WZShowAlertView) {
        print("actionSheetWillShow")
    }
    
    func actionSheetDidShow(_ sheet: WZShowAlertView) {
        print("actionSheetDidShow")
    }
    
    func actionSheetWillDismiss(_ sheet: WZShowAlertView) {
        print("actionSheetWillDismiss")
    }
}
