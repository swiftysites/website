import SwiftySites

let tagGenerator = TaggedBlog.generatorC { site in
    site.contentB.tags.map { tag in
        TagPage("/tags/\(tag)", tag: tag)
    }
}
