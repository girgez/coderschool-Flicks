//
//  AlertMessage.swift
//  Movies
//
//  Created by Girge on 10/16/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import Foundation
import UIKit

enum AlertMessageType {
    case success
    case info
    case warning
    case danger
}

struct BackgroundColorAlertMessage {
    static let success: UIColor = .green
    static let info: UIColor = .blue
    static let warning: UIColor = .orange
    static let danger: UIColor = .red
}

struct AlertMessageIcon {
    static let success = #imageLiteral(resourceName: "alertMessageSuccessIcon")
    static let info = #imageLiteral(resourceName: "alertMessageInfoIcon")
    static let warning = #imageLiteral(resourceName: "alertMessageWarningIcon")
    static let danger = #imageLiteral(resourceName: "alertMessageDangerIcon")
}

class AlertMessage {
    private static let defaultPosition = CGPoint(x: 5, y: 5)
    private static let defaultWidth:CGFloat = 310.0
    private static let defaultHeigth: CGFloat = 50.0
    private static let defaultRectIcon = CGRect(x: 5, y: 5, width: 40, height: 40)
    
    private static func setView(type: AlertMessageType, title: String) -> UIView {
        
        let imageView = UIImageView(frame: defaultRectIcon)
        
        let label = UILabel(frame: CGRect(x: 50, y: 5, width: 260, height: 0))
        label.numberOfLines = 0
        label.font.withSize(13)
        label.lineBreakMode = .byWordWrapping
        label.text = title
        label.sizeToFit()
        
        let view = UIView(frame: CGRect(origin: defaultPosition, size: CGSize(width: defaultWidth, height: defaultHeigth - 10 > label.frame.height ? defaultHeigth : label.frame.height + 10)))
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        switch type {
        case AlertMessageType.success:
            imageView.image = AlertMessageIcon.success
            view.backgroundColor = BackgroundColorAlertMessage.success
        case AlertMessageType.info:
            imageView.image = AlertMessageIcon.info
            view.backgroundColor = BackgroundColorAlertMessage.info
        case AlertMessageType.warning:
            imageView.image = AlertMessageIcon.warning
            view.backgroundColor = BackgroundColorAlertMessage.warning
        case AlertMessageType.danger:
            imageView.image = AlertMessageIcon.danger
            view.backgroundColor = BackgroundColorAlertMessage.danger
        }
        
        return view
    }
    
    static func show(type: AlertMessageType, title: String){
        let view = AlertMessage.setView(type: type, title: title)
        
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            vc.view.addSubview(view)
        }
    }
}
