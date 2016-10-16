//
//  ProgressHUD.swift
//  Movies
//
//  Created by GIRGEZ on 10/13/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import Foundation
import VHUD
import SVProgressHUD

struct ProgressHUD {
    static func setup() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.setDefaultMaskType(.black)
//        VHUDContent.defaultLoadingText = "Loading..."
//        VHUDContent.defaultShape = .circle
//        VHUDContent.defaultStyle = .light
//        VHUDContent.defaultBackground = .blur(.light)
    }
    static func show() {
//        VHUD.show(loopInterval: 2.0)
        SVProgressHUD.show(withStatus: "Loading...")
    }
    static func dismiss() {
//        VHUD.dismiss(0.3)
        SVProgressHUD.dismiss()
    }
}
