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
        self.parseWrapper.queryClass("Guild") { objs -> Void in
            var guilds: [Guild] = []
            for obj in objs {
                let id = obj.objectId!
                let name = obj["guildName"] as! String
                let members = obj["members"] as AnyObject
                let image = self.parseWrapper.getImageFromFile(obj["guildImage"])
                let aGuild = Guild(objectId: id, guildName: name, guildImage: image, members: members, tags: NSObject())
                guilds.append(aGuild)
            }
            completionHandler?(guilds)
        }
    }
    
    public func getUserGuilds(completionHandler: ([Guild] -> Void)?) {
        self.parseWrapper.getMemberGuilds { objs in
            var guilds: [Guild] = []
            for obj in objs {
                let id = obj.objectId!
                let name = obj["guildName"] as! String
                let members = obj["members"] as AnyObject
                let image = self.parseWrapper.getImageFromFile(obj["guildImage"])
                let aGuild = Guild(objectId: id, guildName: name, guildImage: image, members: members, tags: NSObject())
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
    
    public func joinGuild(guild: Guild) {
        self.parseWrapper.addCurrentUserToGuild(guild.objectId)
    }
    
    public func getMembersFromGuild(guild: Guild, completionHandler: ([PFUser] -> Void)?) {
        self.parseWrapper.queryRelation(guild.members as! PFRelation, completionHandler: completionHandler)
    }
}