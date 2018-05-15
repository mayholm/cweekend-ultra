//
//  UIViewController+newFromStoryboard.swift
//  Ultra
//
//  Created by Pär Majholm on 5/13/18.
//  Copyright © 2018 Pär Majholm. All rights reserved.
//

import UIKit

extension UIViewController {
    /** Creates an instance of Self from the storyboard whose file name
     matches the type name of Self. The storyboard's initial view
     controller is instantiated and returned. **/
    class func newFromStoryboard() -> Self {
        func newFromStoryboardHelper<T>() -> T {
            let storyboard = UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
            guard let viewController = storyboard.instantiateInitialViewController() as? T else {
                fatalError()
            }
            return viewController
        }
        return newFromStoryboardHelper()
    }
}
