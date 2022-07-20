//
//  MSConstant.swift
//  MovieSearch
//

import Foundation
import UIKit

var mainstoryboard: UIStoryboard{
    let bundle = Bundle.init(for: MSMovieListViewController.self)
    return UIStoryboard(name:"Main",bundle: bundle)
}

func MSRGBCOLOR(rgbValue: Any, alpha:CGFloat=1.0) -> UIColor {
    return UIColor(red: CGFloat((Float(((rgbValue as? Int)! & 0x00ff0000) >> 16)) / 0xff), green: CGFloat((Float(((rgbValue as? Int)! & 0x0000ff00) >> 8)) / 0xff), blue: CGFloat((Float(((rgbValue as? Int)! & 0x000000ff) >> 0)) / 0xff), alpha: alpha)
}

let MSHeaderFont = UIFont.msBoldFontOfSize(24)
let MSSubHeaderFont = UIFont.msBoldFontOfSize(16)
let MSTitleFont = UIFont.msMediumFontOfSize(16)
let MSSubTitleFont = UIFont.msMediumFontOfSize(14)
let MSLightFont = UIFont.msMediumFontOfSize(26)
let MSSubLightFont = UIFont.msMediumFontOfSize(14)

let MSButtonColour = MSRGBCOLOR(rgbValue: 0x44c3a1)
let MSButtonGrayColour = MSRGBCOLOR(rgbValue: 0x9ca09d)
let MSTextColour = MSRGBCOLOR(rgbValue: 0x405566)
let MSButtonTextColour = MSRGBCOLOR(rgbValue: 0xFFFFFF)

let searchMovieKey = "searchMovieKey"
