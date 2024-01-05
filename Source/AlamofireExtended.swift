//
//  AlamofireExtended.swift
//
//  Copyright (c) 2019 Alamofire Software Foundation (http://alamofire.org/)
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

///这是可扩展编程 设计模式的具体应用
/// Type that acts as a generic extension point for all `AlamofireExtended` types.
public struct AlamofireExtension<ExtendedType> {
    /// Stores the type or meta-type of any extended type.
    public private(set) var type: ExtendedType

    /// Create an instance from the provided value.
    ///
    /// - Parameter type: Instance being extended.
    public init(_ type: ExtendedType) {
        self.type = type
    }
}

/// Protocol describing the `af` extension points for Alamofire extended types.
public protocol AlamofireExtended {
    /// Type being extended. 关联类型(只能用在协议中)，在使用时会确定其最终类型
    associatedtype ExtendedType

    /// Static Alamofire extension point.
    static var af: AlamofireExtension<ExtendedType>.Type { get set }
    /// Instance Alamofire extension point.
    var af: AlamofireExtension<ExtendedType> { get set }
}

extension AlamofireExtended {
    /// Static Alamofire extension point.
    public static var af: AlamofireExtension<Self>.Type {
        get { AlamofireExtension<Self>.self }
        ///set方法什么也不做
        set {}
    }

    /// Instance Alamofire extension point.
    public var af: AlamofireExtension<Self> {
        get { AlamofireExtension(self) }
        set {}
    }
}
