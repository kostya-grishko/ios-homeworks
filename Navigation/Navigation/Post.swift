
import Foundation

struct Post {
    
    var title: String?
    var author: String?
    var description: String?
    var image: String?
    var likes: Int?
    var views: Int?
    var isViewed: Bool?
    
    static func uploadPosts() -> [Post] {
        
        var postArray = [Post]()
        
        postArray.append(Post(title: "Yoda Cat", author: "realgrumpycat", description: "Time to treat your pets to some new accessories! Get the Grumpy Cat collection from @petrageousdesigns available at @amazon - (Link in bio) https://grumpy.cat/gcpetrageous", image: "4563", likes: 122, views: 3210, isViewed: false))
        postArray.append(Post(title: "Just Me", author: "realgrumpycat", description: "Life on Mars…Is Awful. New Grumpy Cat #NFT available now on @withfoundation https://foundation.app/grumpycat/grumpy-cat-life-on-mars-is-awful-14570 (Link in bio)", image: "2341", likes: 382, views: 1233, isViewed: false))
        postArray.append(Post(title: "Cat’s Worst Christmas", author: "realgrumpycat", description: "Grumpy Cat’s Worst Christmas Ever is streaming NOW on @discoveryplus! Start your free 7 day trial and watch today! It will be terrible!", image: "6343", likes: 221, views: 2321, isViewed: false))
        postArray.append(Post(title: "Grumpy Cat NFTs", author: "realgrumpycat", description: "May the 4th be awful.", image: "5324", likes: 127, views: 3422, isViewed: false))
        
        return postArray
    }
}
