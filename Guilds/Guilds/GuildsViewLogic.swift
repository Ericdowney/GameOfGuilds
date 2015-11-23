//
//  GuildsViewLogic.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class GuildsViewLogic: ViewLogic {

    public func getGuilds(completionHandler: ([Guild] -> Void)?) {
        self.parseWrapper.queryClass("Guild") { objs -> Void in
            var guilds: [Guild] = []
            for obj in objs {
                let name = obj["guildName"] as! String
                let members = obj["members"] as AnyObject
                let image = self.parseWrapper.getImageFromFile(obj["guildImage"])
//                let tags = obj["tags"]
                let aGuild = Guild(guildName: name, guildImage: image, members: members, tags: NSObject())
                guilds.append(aGuild)
            }
            completionHandler?(guilds)
        }
    }
    
    public func createGuild(guildName: String, description: String, image: UIImage, completionHandler: (Void -> Void)?) {
        let info = [
            "guildName": guildName,
            "description": description,
            "guildImage": self.parseWrapper.saveImage(image)
        ]
        self.parseWrapper.saveObject("Guild", dictionary: info) { success in
            completionHandler?()
        }
    }
}