import SwiftySites

let pageTemplate = Template(exclude: #//posts|/tags|//#) { (page: Page) in baseLayout(page: page, main: """
<main>
    \(page.content)
</main>
""" ) }

let homeTemplate = Template(#///#) { (page: Page) in baseLayout(page: page, main: """
<main>
    \(page.content)
    <hr />
    \(posts.sorted(by: TaggedPost.dateDescendingOrder).enumerated().map {
        """
        \(postPartial($1))
        \($0 < posts.count - 1 ? "<hr />" : "")
        """
    }.joined())
</main>
""" ) }

let homeXMLTemplate = Template(#///#, index: "feed", suffix: "rss") { (page: Page) in """
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
    <channel>
        <title>\(config.title)</title>
        <link>\(config.url)</link>
        <description>\(config.description)</description>
        <generator>SwiftySites -- swiftysites.diegolavalle.com</generator>
        <language>\(config.language)</language>
        <managingEditor>\(config.editor)</managingEditor>
        <webMaster>\(config.webmaster)</webMaster>
        <copyright>\(config.copyright)</copyright>
        <lastBuildDate>\(rssTimeStamp)</lastBuildDate>
        <pubDate>\(rssTimeStamp)</pubDate>
        <ttl>250</ttl>
        <atom:link href="\(config.url)/feed.rss" rel="self" type="application/rss+xml" />
        \(posts.reduce("") {"""
        \($0)
        <item>
            <guid isPermaLink="true">\(config.url)\($1.path)</guid>
            <title>\($1.title)</title>
            <description>\($1.$content)</description>
            <link>\(config.url)\($1.path)</link>
            <pubDate>\($1.dateRssFormatted)</pubDate>
            <content:encoded>
                <![CDATA[\($1.content)]]>
            </content:encoded>
        </item>
        """})
    </channel>
</rss>
""" }

let postsSectionTemplate = Template(#//posts/#) { (page: Page) in baseLayout(page: page, main: """
<main>
    \(page.content)
    <hr />
    <ul>
        \(posts.reduce("") {
            $0 + """
            <li>
                <a href="\($1.path)">\($1.title)</a>
            </li>
            """
        })
    </ul>
</main>
""" ) }

let postTemplate = Template { (post: TaggedPost) in baseLayout(post: post, main: """
<main>
    \(postPartial(post))
</main>
""" ) }

let tagsSectionTemplate = Template(#//tags/#) { (page: Page) in baseLayout(page: page, main: """
<main>
    \(page.content)
    <hr />
    <ul>
        \(tagPages.reduce("") {
            $0 + """
            <li>
                <a href="\($1.path)">\($1.tag)</a>
            </li>
            """
        })
    </ul>
</main>
""" ) }

let tagTemplate = Template(#//tags/[\w\-]*/#) { (page: TagPage) in baseLayout(tagPage: page, main: """
<main>
    <p>Content about topic: \(page.tag)</p>
    <hr />
    <ul>
        \(posts.filter {
            $0.tags.contains(page.tag)
        }.reduce("") {
            $0 + """
            <li>
                <a href="\($1.path)">\($1.title)</a>
            </li>
            """
        })
    </ul>
</main>
""" ) }
