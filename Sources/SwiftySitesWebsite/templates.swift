import SwiftySites

let pageTemplate = BasicBlog.templateA(exclude: #"(/)|(/posts)"#) { site, page in baseLayout(site: site, page: page, main: """
<main>
    \(page.content)
</main>
""" ) }

let homeTemplate = BasicBlog.templateA("/") { site, page in baseLayout(site: site, page: page, main: """
<main>
    \(page.content)
    <hr />
    \(site.contentB.sorted(by: Post.dateDescendingOrder).enumerated().map {
        """
        \(postPartial(site, $1))
        \($0 < site.contentB.count - 1 ? "<hr />" : "")
        """
    }.joined())
</main>
""" ) }

let homeXMLTemplate = BasicBlog.templateA("/", index: "feed", suffix: "rss") { site, page in """
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
    <channel>
        <title>\(site.title)</title>
        <link>\(site.url)</link>
        <description>\(site.description)</description>
        <generator>SwiftySites -- swiftysites.diegolavalle.com</generator>
        <language>\(site.language)</language>
        <managingEditor>\(site.editor)</managingEditor>
        <webMaster>\(site.webmaster)</webMaster>
        <copyright>\(site.copyright)</copyright>
        <lastBuildDate>\(site.buildDate)</lastBuildDate>
        <pubDate>\(site.buildDate)</pubDate>
        <ttl>250</ttl>
        <atom:link href="\(site.url)/feed.rss" rel="self" type="application/rss+xml" />
        \(site.contentB.reduce("") {"""
        \($0)
        <item>
            <guid isPermaLink="true">\(site.url)\($1.path)</guid>
            <title>\($1.title)</title>
            <description>\($1.$content)</description>
            <link>\(site.url)\($1.path)</link>
            <pubDate>Thu, 26 Aug 2021 15:15:00 +0200</pubDate>
            <content:encoded>
                <![CDATA[\($1.content)]]>
            </content:encoded>
        </item>
        """})
    </channel>
</rss>
""" }

let postsSectionTemplate = BasicBlog.templateA("/posts") { site, page in baseLayout(site: site, page: page, main: """
<main>
    \(page.content)
    <hr />
    <ul>
        \(site.contentB.reduce("") {
            $0 + """
            <li>
                <a href="\($1.path)">\($1.title)</a>
            </li>
            """
        })
    </ul>
</main>
""" ) }

let postTemplate = BasicBlog.templateB { site, post in baseLayout(site: site, post: post, main: """
<main>
    \(postPartial(site, post))
</main>
""" ) }

let tagsSectionTemplate = BasicBlog.templateA("/tags") { site, page in baseLayout(site: site, page: page, main: """
<main>
    \(page.content)
    <hr />
    <ul>
        \(site.contentC.reduce("") {
            $0 + """
            <li>
                <a href="\($1.path)">\($1.tag)</a>
            </li>
            """
        })
    </ul>
</main>
""" ) }

let tagTemplate = BasicBlog.templateC(#"/tags/\w*"#) { site, page in baseLayout(site: site, tagPage: page, main: """
<main>
    <p>Content about topic: \(page.tag)</p>
    <hr />
    <ul>
        \(site.contentB.filter {
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
