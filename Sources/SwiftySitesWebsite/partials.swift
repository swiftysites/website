import SwiftySites

let navigationPartial = { @Sendable (page: Page?) -> String in """
<nav>
    <ul>
        \(pages.reduce("") {
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

let postPartial = { @Sendable (post: TaggedPost) -> String in """
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
