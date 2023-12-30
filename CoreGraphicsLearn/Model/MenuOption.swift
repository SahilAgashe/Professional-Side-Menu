//
//  MenuOption.swift
//  CoreGraphicsLearn
//
//  Created by SAHIL AMRUT AGASHE on 30/12/23.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(systemName: "person.crop.square")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .Inbox: return UIImage(systemName: "square.and.pencil")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .Notifications: return UIImage(systemName: "bell")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .Settings: return UIImage(systemName: "gear")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        }
    }
}
