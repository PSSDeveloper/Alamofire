//
//  URLSessionConfiguration+Alamofire.swift
//
//  Copyright (c) 2014-2018 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
///URLSessionConfiguration遵守AlamofireExtened协议，且协议已有默认实现
extension URLSessionConfiguration: AlamofireExtended {}

///对AlamofireExtension当泛型类型是URLSessionConfiguration时进行扩展，新增两个静态变量
extension AlamofireExtension where ExtendedType: URLSessionConfiguration {
    /// Alamofire's default configuration. Same as `URLSessionConfiguration.default` but adds Alamofire default
    /// `Accept-Language`, `Accept-Encoding`, and `User-Agent` headers.
    public static var `default`: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        //给configuration赋值默认的请求头，该headers通过extension添加上去
        configuration.headers = .default

        return configuration
    }

    /// `.ephemeral` configuration with Alamofire's default `Accept-Language`, `Accept-Encoding`, and `User-Agent`
    /// headers.
    public static var ephemeral: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.headers = .default

        return configuration
    }
}
