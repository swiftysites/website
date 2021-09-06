import SwiftySites

let navigationPartial = { (site: BasicBlog, page: Page?) -> String in """
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

let postPartial = { (site: BasicBlog, post: Post) -> String in """
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
