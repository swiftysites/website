import SwiftySites
import Foundation

let siteMap = BasicBlog(
    SiteConfig(
        title: "SwiftySites",
        description: "Documentation and news about the SwiftySites framework for generating static sites.",
        language: "en-us",
        editor: "swiftysites@diegolavalle.com",
        webmaster: "dev@diegolavalle.com",
        copyright: "Copyright © ∞ SwiftySites",
        productionUrl: URL(string: "https://swiftysites.diegolavalle.com")!,
        developmentUrl: URL(string: "http://localhost.localdomain")!
    ),
    contentA: [homePage, cmarkGfmPage, postsIndexPage, tagsPage],
    contentB: [helloWorldPost, supportingMarkdownPost, syntaxHightlightingPost],
    templates: [pageTemplate, homeTemplate, homeXMLTemplate, postsSectionTemplate, tagsSectionTemplate, postTemplate, tagTemplate],
    generators: [tagGenerator]
).render()

print(siteMap.urls)
