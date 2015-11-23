//
//  GuildsViewLogic.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit
import Parse

public class GuildsViewLogic: ViewLogic {

    public func getGuilds(completionHandler: ([Guild] -> Void)?) {
        self.parseWrapper.queryClass("Guild") { objs in
            completionHandler?(self.getGuildsFromList(objs))
        }
    }
    
    public func getUserGuilds(completionHandler: ([Guild] -> Void)?) {
        self.parseWrapper.getMemberGuilds { objs in
            completionHandler?(self.getGuildsFromList(objs))
        }
    }
    
    private func getGuildsFromList(list: [AnyObject]) -> [Guild] {
        var guilds: [Guild] = []
        for obj in list {
            let id = obj.objectId!
            let name = obj.valueForKey("guildName")! as! String
            let members = obj.valueForKey("members")! as AnyObject
            let image = self.parseWrapper.getImageFromFile(obj["guildImage"])
            let aGuild = Guild(objectId: id!, guildName: name, guildImage: image, members: members, tags: NSObject())
            guilds.append(aGuild)
        }
        return guilds;
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
    
    public func joinGuild(guild: Guild) {
        self.parseWrapper.addCurrentUserToGuild(guild.objectId)
    }
}