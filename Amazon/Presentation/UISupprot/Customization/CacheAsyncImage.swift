//
//  CashAsynkImage.swift
//  Amazon
//
//  Created by Mahmoud Alaa on 14/07/2022.
//


import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {

    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content

    init(
        url: URL?,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    var body: some View {
        
        if let url = url {
            if let cached = ImageCache[url] {
                content(.success(cached))
            } else {
                AsyncImage(
                    url: url,
                    scale: scale,
                    transaction: transaction
                ) { phase in
                    cacheAndRender(phase: phase)
                }
            }
        }
        
    }

    func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if let url = url, case .success(let image) = phase {
            ImageCache[url] = image
        }

        return content(phase)
    }
}

struct CacheAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CacheAsyncImage(
            url: nil
        ) { phase in
            switch phase {
            case .success(let image):
                image
            default:
                ProgressView()
            }
        }
    }
}


fileprivate class ImageCache {
    static private var cache: [URL: Image] = [:]

    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}

