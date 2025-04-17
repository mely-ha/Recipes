//
//  WebView.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/14/25.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

//struct ContentView: View {
  //  var body: some View {
    //    WebView(url: URL(string: "https://www.youtube.com/watch?v=kSKtb2Sv-_U") ?? "")
    //}
//}
