import SwiftySites

let homePage = Page("/", "Home") { #"""

# SwiftySites

SwiftySites is a library for generating static websites with Xcode or the Swift Package Manager (SPM). Write your content entirely in Markdown. Create some HTML templates using Swift's string interpolation. Combine it all in a site declaration and export for preview or publication.

Check out the DocC <a href="/documentation/" target="_blank">documentation</a> for more. Source code available [here](https://github.com/swiftysites/swiftysites).
"""# }

let gfMarkdownPage = Page("/gfmarkdown", "GFMarkdown") { """

# GFMarkdown Library

The [GFMarkdown](https://github.com/swiftysites/gfmarkdown) Swift library is a wrapper around the excellent [cmark-gfm](https://github.com/github/cmark-gfm) C library.

Originally developed for SwiftySites, it can be used from any Swift project needing to translate CommonMark / GitHub Flavored Markdown (GFM) into plain old HTML.

It exposes a simple interface for parsing Markdown strings while exposing all CMark options as well as every GFM extension available. This can be done via the `@Markdown` property wrapper or using the `MarkdownString` object.

GFMarkdown is distributed as a Swift Package and includes all binary dependencies for macOS (Apple Silicon and Intel) and Linux. Find the full DocC documentation [here](/documentation/gfmarkdown/) as well as attached to each release.

""" }

let postsIndexPage = Page("/posts", "Archive") { """

# All posts

Find every post ever published on this site right down below.

""" }

let tagsPage = Page("/tags", "Topics") { """

# All topics

Open a topic to see all related posts.

""" }
