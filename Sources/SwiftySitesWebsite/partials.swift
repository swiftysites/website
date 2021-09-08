import SwiftySites

let navigationPartial = { (site: TaggedBlog, page: Page?) -> String in """
<nav>
    <ul>
        \(site.contentA.reduce("") {
            $0 + """
            <li>\(page?.path == $1.path
                ? """
                \($1.title)
                """
                : """
                <a href="\($1.path)">\($1.title)</a>
                """
            )</li>
            """
        })
    </ul>
</nav>
""" }

let postPartial = { (site: TaggedBlog, post: TaggedPost) -> String in """
<article>
    <header>
        <h1><a href="\(post.path)">\(post.title)</a></h1>
        <div>\(post.author) on \(post.dateFormatted)</div>
    </header>
    <main>
    \(post.content)
    </main>
</article>
""" }
