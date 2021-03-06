//
//  WZShowAlertView+Public.swift
//  WZAlertViewController_Example
//
//  Created by xiaobin liu on 2019/8/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Foundation



// MARK: - public func
extension WZShowAlertView {
    
    /// 显示视图
    ///
    /// - Parameter inView: 显示在那个view上面(如果为nil就显示在window上面)
   @objc public func show(inView: UIView? = nil) {
        
        var showInView: UIView!
        if let temView = inView {
            showInView = temView
        } else {
            
            let currentWindows = UIApplication.shared.windows
            guard let window = currentWindows.first,
                let temView = window.rootViewController?.view else {
                    fatalError("当前主窗口不能为nil")
            }
            showInView = temView
        }
        
        delegate?.actionSheetWillShow(self)
        
        if self.superview == nil {
            showInView.addSubview(self)
        }
        
        let isShow = true
        switch alertStyle {
        case let .actionSheet(directionType):
            animationDirection(directionType, isShow: isShow)
        case let .alert(animateType):
            alertAnimateType(animateType, isShow: isShow)
        }
    }
    
    /// 隐藏
    @objc public func dismiss() {
        
        guard self.superview != nil else {
            return
        }
        
        delegate?.actionSheetWillDismiss(self)
        
        let isShow = false
        switch alertStyle {
        case let .actionSheet(directionType):
            animationDirection(directionType, isShow: isShow)
        case let .alert(animateType):
            alertAnimateType(animateType, isShow: isShow)
        }
    }
    
    
    /// 显示弹窗视图(默认显示在window)
    ///
    /// - Parameters:
    ///   - alertStyle: 弹出风格
    ///   - showInView: 显示在那个view上面
    ///   - contentView: 内容视图
    ///   - backgoundTapDismissEnable: 点击背景是否隐藏
    ///   - isShowMask: 是否遮照
    ///   - alertViewEdging: 弹出视图变局
    ///   - alertViewOriginY: 根据Y轴中心点设置偏移量
    ///   - delegate: 委托
    @discardableResult
    public static func showAlertView(alertStyle: WZAlertStyle = .alert(animateType: .direction(type: .top)),
                                     showInView: UIView? = nil,
                                     contentView: UIView,
                                     backgoundTapDismissEnable: Bool = true,
                                     isShowMask: Bool = true,
                                     alertViewEdging: CGFloat = 0,
                                     alertViewOriginY: CGFloat = 0,
                                     delegate: WZShowAlertViewDelegate? = nil) -> WZShowAlertView {
        
        let showView = WZShowAlertView(contentView: contentView)
        showView.backgoundTapDismissEnable = backgoundTapDismissEnable
        showView.delegate = delegate
        showView.alertStyle = alertStyle
        showView.alertViewOriginY = alertViewOriginY
        showView.alertViewEdging = alertViewEdging
        showView.isShowMask = isShowMask
        showView.show(inView: showInView)
        return showView
    }
    
    
    /// 开始刷新布局
    public func beginUpdateLayout() {
        layoutConstraintHeight?.isActive = false
    }
    
    /// 刷新布局
    public func updateLayout() {
        
        layoutConstraintHeight?.isActive = false
        contentViewWidth = superview!.frame.width - alertViewEdging * 2
        let contentViewSize = contentView.systemLayoutSizeFitting(CGSize(width: contentViewWidth, height: 0.0), withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.fittingSizeLevel)
        contentViewHeight = contentViewSize.height
        layoutConstraintHeight?.constant = contentViewHeight
        layoutConstraintHeight?.isActive = true
        
//        UIView.animate(withDuration: 0.23) {
//            self.setNeedsLayout()
//            self.layoutIfNeeded()
//        }
    }
}
