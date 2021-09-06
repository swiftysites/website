import SwiftySites

let tagGenerator = BasicBlog.generatorC { site in
    site.contentB.tags.map { tag in
        TagPage("/tags/\(tag)", tag: tag)
    }
}
