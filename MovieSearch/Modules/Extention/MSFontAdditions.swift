//
//  UIFontAdditions.swift
//  MovieSearch
//

import Foundation
import UIKit

extension UIFont {
    
    class func msBoldFontOfSize(_ fontSize: CGFloat) -> UIFont? {
        return self.init(name: "Helvetica-Bold", size: fontSize)
    }
    
    class func msMediumFontOfSize(_ fontSize: CGFloat) -> UIFont? {
        return self.init(name: "HelveticaNeue-Medium", size: fontSize)
    }
    
    class func msLightFontOfSize(_ fontSize: CGFloat) -> UIFont? {
        return self.init(name: "HelveticaNeue-Light", size: fontSize)
    }
    
}
