# Swift Sitemap

A Swift package for generating XML sitemaps following the [sitemaps.org](https://www.sitemaps.org/) protocol.

## Features

- **Type-safe API** for creating XML sitemaps
- **Full metadata support** including `lastmod`, `changefreq`, and `priority`
- **Flexible URL generation** with router-based initialization
- **Swift 5.9 and 6.0 compatibility**
- **Zero dependencies**

## Installation

Add swift-sitemap to your Swift package dependencies in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-sitemap.git", from: "0.0.1")
]
```

## Usage

### Basic Usage

```swift
import Sitemap

// Create URLs with metadata
let urls = [
    Sitemap.URL(
        location: URL(string: "https://example.com")!,
        lastModification: Date(),
        changeFrequency: .daily,
        priority: 1.0
    ),
    Sitemap.URL(
        location: URL(string: "https://example.com/about")!,
        changeFrequency: .monthly,
        priority: 0.8
    )
]

// Generate sitemap
let sitemap = Sitemap(urls: urls)
let xmlString = sitemap.xml
```

### Router-based Generation

For larger sites, use the router-based approach:

```swift
enum Page {
    case home, about, contact
}

let router: (Page) -> URL = { page in
    switch page {
    case .home: return URL(string: "https://example.com")!
    case .about: return URL(string: "https://example.com/about")!
    case .contact: return URL(string: "https://example.com/contact")!
    }
}

let metadata: [Page: Sitemap.URL.MetaData] = [
    .home: Sitemap.URL.MetaData(changeFrequency: .daily, priority: 1.0),
    .about: Sitemap.URL.MetaData(changeFrequency: .monthly, priority: 0.8),
    .contact: Sitemap.URL.MetaData(changeFrequency: .yearly, priority: 0.5)
]

let urls = [Sitemap.URL](router: router, metadata)
let sitemap = Sitemap(urls: urls)
```

### Generated XML

The package generates standard XML sitemap format:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<url>
<loc>https://example.com</loc>
<lastmod>2025-01-15</lastmod>
<changefreq>daily</changefreq>
<priority>1.0</priority>
</url>
<url>
<loc>https://example.com/about</loc>
<changefreq>monthly</changefreq>
<priority>0.8</priority>
</url>
</urlset>
```

## API Reference

### `Sitemap`

The main struct for creating XML sitemaps.

- `init(urls: [Sitemap.URL])` - Create sitemap with array of URLs
- `xml: String` - Generate XML string representation

### `Sitemap.URL`

Represents a single URL entry in the sitemap.

- `location: Foundation.URL` - The URL location
- `metadata: MetaData` - Associated metadata

### `Sitemap.URL.MetaData`

Contains optional sitemap metadata:

- `lastModification: Date?` - When the page was last modified
- `changeFrequency: ChangeFrequency?` - How frequently the page changes
- `priority: Float?` - Priority relative to other URLs (0.0-1.0)

### `Sitemap.URL.ChangeFrequency`

Enum for change frequency values:
- `.always`, `.hourly`, `.daily`, `.weekly`, `.monthly`, `.yearly`, `.never`

## Related Projects

### The coenttb stack

* [swift-html](https://www.github.com/coenttb/swift-html): A Swift DSL for domain accurate, type-safe HTML & CSS.
* [coenttb-web](https://www.github.com/coenttb/coenttb-web): Web development in Swift.
* [coenttb-server](https://www.github.com/coenttb/coenttb-server): Server development in Swift.
* [coenttb-com-server](https://www.github.com/coenttb/coenttb-com-server): the source code for [coenttb.com](https://coenttb.com) built on coenttb-server.

## Feedback and Contributions

If you're working on your own Swift web project, feel free to learn, fork, and contribute.

Got thoughts? Found something you love? Something you hate? Let me know! Your feedback helps make this project better for everyone. Open an issue or start a discussion—I'm all ears.

> [Subscribe to my newsletter](http://coenttb.com/en/newsletter/subscribe)
>
> [Follow me on X](http://x.com/coenttb)
> 
> [Link on Linkedin](https://www.linkedin.com/in/tenthijeboonkkamp)

## License

This project is licensed under the **Apache 2.0 License**. See the [LICENSE](LICENSE).
