//
//  ViewController.swift
//  WZAlertViewController
//
//  Created by LiuSky on 08/07/2019.
//  Copyright (c) 2019 LiuSky. All rights reserved.
//

import UIKit
import WZAlertViewController


/// MARK - ViewController
final class ViewController: UIViewController {

    /// 演示列表
    private lazy var tableView: UITableView = {
        let temTableView = UITableView()
        temTableView.backgroundColor = UIColor.white
        temTableView.separatorInset = .zero
        temTableView.rowHeight = 50
        temTableView.delegate = self
        temTableView.dataSource = self
        temTableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing:UITableViewCell.self))
        return temTableView
    }()
    
    private var alertView: WZShowAlertView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configView()
        configLocation()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "隐藏", style: UIBarButtonItemStyle.done, target: self, action: #selector(eventForDis))
    }
    
    
    /// 配置视图
    private func configView() {
        view.addSubview(tableView)
    }
    
    /// 配置位置
    private func configLocation() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc private func eventForDis() {
        self.alertView?.dismiss()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WZAlertStyle.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))
        cell?.textLabel?.text = WZAlertStyle.allCases[indexPath.row].description
        return cell!
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = WZAlertStyle.allCases[indexPath.row]
        
        let autolatoutView = WZAutoLayoutView()
        alertView = WZShowAlertView.showAlertView(alertStyle: type,
                                      showInView: self.view,
                                      contentView: autolatoutView,
                                      backgoundTapDismissEnable: false,
                                      isShowMask: true,
                                      alertViewEdging: 20,
                                      alertViewOriginY: 10, delegate: self)
    }
}



// MARK: - WZShowActionSheetViewDelegate
extension ViewController: WZShowAlertViewDelegate {
    
    func actionSheetWillShow(_ sheet: WZShowAlertView) {
        print("actionSheetWillShow")
    }
    
    func actionSheetDidShow(_ sheet: WZShowAlertView) {
        print("actionSheetDidShow")
    }
    
    func actionSheetWillDismiss(_ sheet: WZShowAlertView) {
        print("actionSheetWillDismiss")
        alertView = nil
    }
}
