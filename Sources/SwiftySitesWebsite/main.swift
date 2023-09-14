import SwiftySites
import Foundation

let config = SiteConfig(
    title: "SwiftySites",
    description: "Documentation and news about the SwiftySites framework for generating static sites.",
    language: "en-us",
    editor: "swiftysites@diegolavalle.com",
    webmaster: "dev@diegolavalle.com",
    copyright: "Copyright © ∞ SwiftySites",
    productionUrl: URL(string: "https://swiftysites.diegolavalle.com")!,
    developmentUrl: URL(string: "http://localhost.localdomain")!
)

let pages = [homePage, gfMarkdownPage, postsIndexPage, tagsPage]
let posts = [helloWorldPost, supportingMarkdownPost, syntaxHightlightingPost, doccPost, themeSwitchPost, doccNetlifyPost]

let tagPages = posts.tags.map { tag in
    TagPage("/tags/\(tag)", tag: tag)
}

let rssTimeStamp = rssTimestamp()

let site = TaggedBlog(
    config,
    content: (pages, posts, tagPages),
    template: ([pageTemplate, homeTemplate, homeXMLTemplate, postsSectionTemplate, tagsSectionTemplate], [postTemplate], [tagTemplate])
)
let siteMap = site.render()

// print(siteMap.urls)
