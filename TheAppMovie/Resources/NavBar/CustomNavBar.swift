//
//  CustomNavBar.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 24/11/2021.
//

import Foundation
import UIKit

class CustomNavBar: UINavigationBar {
    
    override init(frame: CGRect) { // for using custom view in code
           super.init(frame: frame)
           setupNavBar()
       }

       required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
           super.init(coder: aDecoder)
           setupNavBar()
       }

       override func awakeFromNib() {
           super.awakeFromNib()
           setupNavBar()
       }

       func setupNavBar() {
           if #available(iOS 13.0, *) {
               let appeararance = UINavigationBarAppearance()
               appeararance.configureWithOpaqueBackground()
               appeararance.backgroundColor = .purple
               appeararance.titleTextAttributes = [.foregroundColor: UIColor.white]
               tintColor = .white
               standardAppearance = appeararance
               scrollEdgeAppearance = appeararance
           } else {
               print("Other versions")
           }
       }

       override func sizeThatFits(_ size: CGSize) -> CGSize {
           return CGSize(width: UIScreen.main.bounds.width, height: 55)
       }
    
    
}
