import SwiftySites

func baseLayout (page: Page? = nil, post: TaggedPost? = nil, tagPage: TagPage? = nil, main: String) -> String { """
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="/assets/global.css" />
        <link id="themeCSSLink" rel="stylesheet" href="/assets/dark.css" media="(prefers-color-scheme: dark)" />
        <link rel="stylesheet" href="/assets/highlight.css" />
        <script src="https://cdn.jsdelivr.net/gh/swiftysites/theme-switch@release/src/theme-switch.min.js"></script>
        <script src="/assets/highlight.js"></script>
        <script>hljs.highlightAll();</script>
        <title>\(config.title) | \(page?.title ?? post?.title ?? tagPage!.tag)</title>
    </head>
    <body>
        <header>
            \(navigationPartial(page))
            <theme-switch stylesheet-id="themeCSSLink" color="rgb(3, 102, 214)" color-dark="rgb(88, 166, 255)"></theme-switch>
        </header>
        \(main)
        <footer>
            <span>Made with  and <a href="https://github.com/swiftysites/swiftysites">SwiftySites</a>.</span>
        </footer>
    </body>
</html>
""" }
