//
//  AlertDialog.swift
//  Movies
//
//  Created by Girge on 10/16/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import Foundation
import UIKit

class AlertDialog {
    static var isShowingAlertDialog = false
    
    static func notConnectInternet() {
        let alertDialog = UIAlertController(title: "Kết nối Internet có vấn đề!", message: "Vui lòng kiểm tra lại kết nối Internet.", preferredStyle: .alert)
        
        alertDialog.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            isShowingAlertDialog = false
        }))
        
        if let vc = UIApplication.shared.keyWindow?.rootViewController, isShowingAlertDialog == false {
            isShowingAlertDialog = true
            vc.present(alertDialog, animated: true, completion: nil)
        }
    }
}
