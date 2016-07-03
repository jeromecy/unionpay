//: Playground - noun: a place where people can play

import UIKit

let url = NSBundle.mainBundle().URLForResource("data", withExtension: "json")
let data = NSData(contentsOfURL: url!)



func readJSONObject(object: [String: AnyObject]) {
    guard let title = object["dataTitle"] as? String,
        let version = object["swiftVersion"] as? Float,
        let users = object["users"] as? [[String: AnyObject]] else { return }
    _ = "Swift \(version) " + title
    
    for user in users {
        guard let name = user["name"] as? String,
            let age = user["age"] as? Int else { break }
        switch age {
        case 22:
            _ = name + " is \(age) years old."
        case 25:
            _ = name + " is \(age) years old."
        case 29:
            _ = name + " is \(age) years old."
        default:
            break
        }
    }
}

do {
    let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
    if let dictionary = object as? [String: AnyObject] {
        readJSONObject(dictionary)
    }
} catch {
    // Handle Error
}