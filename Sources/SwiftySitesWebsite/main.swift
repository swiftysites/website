import SwiftySites

let homePage = Page("Home Page", path: "/") { #"""

Welcome to the _SwiftySites_ Website!

Bear with me as [the library](https://github.com/swiftysites/swiftysites) evolves towards its first stable release.

Come back for regular news and updates!

In the meantime here's the current contents of the `main.swift` file used to generate this very page:

```swift
let homePage = Page("Home Page", path: "/") { """
Some markdown here…
"""

let pageTemplate = BasicSite.templateA { site, page in """
<html> …some HTML here. </html>
""" }

BasicSite(
    SiteConfig(title: "SwiftySites"),
    contentA: [homePage],
    templates: [pageTemplate]
).render()
```

Cheers!

"""# }

let pageTemplate = BasicSite.templateA { site, page in """
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="/theme/global.css" />
        <title>\(site.config.title) - \(page.title)</title>
    </head>
    <body>
        <main>
            \(page.html)
        </main>
        <footer>Made with  using <a href="https://github.com/swiftysites/swiftysites">SwiftySites</a>.
        </footer>
    </body>
</html>
""" }

BasicSite(
    SiteConfig(title: "SwiftySites"),
    contentA: [homePage],
    templates: [pageTemplate]
).render()
