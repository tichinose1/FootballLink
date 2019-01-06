//
//  Player.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift

class Player: Object {
    @objc dynamic var name: String = ""
    let associations = LinkingObjects(fromType: Association.self, property: "players")

    convenience init(name: String) {
        self.init()

        self.name = name
    }

    var url: String {
        return "https://en.wikipedia.org/wiki/\(path)#Career_statistics"
    }

    var association: Association {
        return associations.first!
    }
}

private extension Player {

    private var path: String {
        return name
            .replacingOccurrences(of: " ", with: "_")
            // `-` を置換
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
    }
}
