//
//  WebkitWrapper.swift
//  Thien-codev-self-learning
//
//  Created by Nguyen Thien on 29/9/24.
//

import SwiftUI
@preconcurrency import WebKit

struct WebViewWrapper: UIViewRepresentable {
    
    private var webView: WKWebView
    private var htmlString: String?
    private var request: URLRequest?
    private var scriptString: String?
    @Binding var isLoading: Bool
    
    init(scriptString: String? = nil, htmlString: String? = nil, request: URLRequest? = nil, isLoading: Binding<Bool>) {
        self.htmlString = htmlString
        self.request = request
        self._isLoading = isLoading
        
        if let scriptString {
            let script: WKUserScript = WKUserScript(source: scriptString, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
            let userContentController: WKUserContentController = WKUserContentController()
            let configuration = WKWebViewConfiguration()
            configuration.userContentController = userContentController
            userContentController.addUserScript(script)
            webView = WKWebView(frame: .zero, configuration: configuration)
        } else {
            webView = WKWebView()
        }
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request {
            webView.load(request)
        } else if let htmlString {
            webView.loadHTMLString(htmlString, baseURL: nil)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onFinishLoading: {
            isLoading = false
        })
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        var onFinishLoading: (() -> Void)?
        
        init(onFinishLoading: (() -> Void)?) {
            self.onFinishLoading = onFinishLoading
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            
            if navigationAction.navigationType == .linkActivated, let url = navigationAction.request.url, UIApplication.shared.canOpenURL(url), !isClickOnElementTag(url: url) {
                UIApplication.shared.open(url)
                decisionHandler(.allow)
                return
            }
            decisionHandler(.allow)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            onFinishLoading?()
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
            onFinishLoading?()
        }
        
        func isClickOnElementTag(url: URL?) -> Bool {
            if let url {
                let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
                return urlComponents?.fragment != nil
            }
            return false
        }
    }
}

