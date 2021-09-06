import SwiftySites

let themeSwitchPost = Post("/posts/theme-switch", "Theme Switch", "dl", "2021-08-16T12:00:00Z") { """
""" }

let doccPost = Post("/posts/docc-web-documentation", "DocC Web Documentation", "dl", "2021-08-15T12:00:00Z") { #"""



"""# }

let syntaxHightlightingPost = Post("/posts/syntax-highlighting", "Syntax Highlighting", "dl", "2021-08-15T12:00:00Z", ["js", "content"]) { #"""

After overcomming the first big challenge of implementing [Markdown support](/posts/supporting-markdown) I found out rather quickly that this did not include any type of syntax hightlighting.

All `pre` blocks were rendered with no color and the code block [info string](https://github.github.com/gfm/#info-string) was largely ignored by my basic stylesheet.

Once again I turned to Apple and noticed they were using [highlight.js](https://highlightjs.org) to generate the code blocks used in [DocC](https://developer.apple.com/documentation/docc).

I decided to [customize](https://highlightjs.org/download/) my download to include only the languages I would need for this blog. I also picked one of the many color schemes they have available.

To put it to the test what better way than including a chunk of the code used to generate this exact page with SwiftySites. Lo and behold the coloring magically appears.

<figcaption>main.js</figcaption>

```swift
let homePage = Page("Home Page", path: "/") { """
_Some markdown here…_
"""

let pageTemplate = BasicSite.templateA { site, page in """
<!doctype html>
<html lang="en">
    …
    <title>\(site.title)</title>
    …
    <main>\(page.content)</main>
    …
</html>
""" }

BasicSite(
    SiteConfig(title: "SwiftySites"),
    contentA: [homePage],
    templates: [pageTemplate]
).render()
```

Now having inspected a DocC-generated site I have noticed that Apple is using a custom language definition for `highlight.js`. Since the code is obfuscated I couldn't extract it to incorporate into this site. Still the default Swift definition is decent enough and all of the other languages render nicely.

"""# }

let supportingMarkdownPost = Post("/posts/supporting-markdown", "Supporting Markdown", "dl", "2021-08-14T12:00:00Z", ["markdown", "content"]) { #"""

One of the first challenges one encounters when building a static site generator is Markdown support.

I knew Apple had just [announced](https://developer.apple.com/videos/play/wwdc2021/10109/?time=486) during WWDC21 support for Markdown in attributed strings and other APIs but offered no interface for directly converting Markdown to HTML.

A bit of digging in the developer forums led me to [this answer](https://developer.apple.com/forums/thread/682711) by an Apple engineer. Now I knew for a fact that internally they were using the fantastic [cmark-gfm](https://github.com/github/cmark-gfm) library.

`cmark-gfm` itself is a fork of the [cmark](https://github.com/commonmark/cmark) C library. GFM stands for [GitHub Flavor Markdown](https://github.github.com/gfm/) and consists of a set of extensions to the [CommonMark](https://commonmark.org) specification.

Having some experience in integrating C code into Swift applications I started adapting `cmark-gfm` for my purposes. The endeavour involved cross-compiling for the relevant architectures and linking to a custom Objective-C framework.

Since `cmark-gfm` lacked a simplified interface for straightforwardly converting GFM to HTML – which the original `cmark` had – I decided to write my own Swift protocol around it. I decided to expose all the options and extensions available from the underlying libraries.

While the whole effort was [open-source](https://github.com/swiftysites/cmark-gfm) I decided to publish the final result as a binary XCFramework. This makes it really easy to include – via Swift Package Manager (SPM) – in SwiftySites or any other project that needs it without the hassle of having to build everything from C sources.

"""# }

let helloWorldPost = Post("/posts/hello-world", "Hello, World!", "dl", "2021-08-13T12:00:00Z", ["content"]) { #"""

Hello and welcome to the humble SwiftySites Blog. As a first post I thought it would be nice to share some of my motivation for building this library.

Nowadays it's pretty common for a programmer to want to show their work and process to the world. It's also common for us to write our own tools.

In the past I had used everything from traditional content management systems to popular [publishing platforms](https://medium.com/swift-you-and-i). For the past few years I settled for the awesome [Hugo](https://gohugo.io) static site generator which I used to build the original [Swift You and I](https://swiftui.diegolavalle.com) publication.

Hugo has a lot of amazing features which I love but it dows require some knowledge of the Go Language for writing the more advanced [templates](https://pkg.go.dev/text/template). For a long time I tried my best to learn but never felt as at home as I do when I write Swift.

Looking for options I quiclky landed in John Sundell's tool [Publish](https://github.com/johnsundell/publish). To be perfectly honest this would have been the tool to choose from the beginnig – had it existed a couple of years back.

At this point I had gotten accustomed to many of the niceties of Hugo and wanted to keep some of them around. John's [DSL approach](https://www.swiftbysundell.com/articles/building-dsls-in-swift/) showed me that the Swift compiler can really be helpful when defining a website's structure so I came up with a hybrid concept.

Instead of declaring everything straight in Swift I decided to split the problem in two. For the content's metadata – which Hugo implements with [Front Matter](https://gohugo.io/content-management/front-matter/) – I would leverage the full power of Swift's type system. For the templates I thought of something else…

Swift already has a great templating solution called [string interpolation](https://www.hackingwithswift.com/read/0/5/string-interpolation). This was the last piece of the puzzle. From the first proof of concept I noticed how nicely the structured metadata merged with the more free string composition.

In the coming weeks I will use this very site to test the concept and document the process of building a framework that hopefully other people find useful.

Cheers!
"""# }

let dogfoodingPost = Post("/posts/supporting-markdown", "Supporting Markdown", "SwiftySites", "2021-08-15T12:00:00Z") { #"""



"""# }

let netlify = Post("/posts/netlify", "Supporting Markdown", "SwiftySites", "2021-08-15T12:00:00Z") { #"""



"""# }

let hugoPost = Post("/posts/hugo", "Supporting Markdown", "SwiftySites", "2021-08-15T12:00:00Z") { #"""



"""# }
