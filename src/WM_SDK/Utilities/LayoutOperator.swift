//
//  LayoutOperator.swift
//  WM_SDK
//
//  Created by Qingzhou Wang on 3/6/19.
//

import Foundation
import Swiftstraints

precedencegroup LayoutAnchorPrecedence {
    associativity: right
    lowerThan: AdditionPrecedence
    higherThan: AssignmentPrecedence
}

infix operator ~: LayoutAnchorPrecedence
infix operator <~: LayoutAnchorPrecedence
infix operator >~: LayoutAnchorPrecedence

@discardableResult public func ~ <T: AxisAnchor, U: AxisAnchor>(lhs: T, rhs: U) -> NSLayoutConstraint where T.AnchorType == U.AnchorType {
    return (lhs == rhs).activate()
}

@discardableResult public func <~ <T: AxisAnchor, U: AxisAnchor>(lhs: T, rhs: U) -> NSLayoutConstraint where T.AnchorType == U.AnchorType {
    return (lhs <= rhs).activate()
}

@discardableResult public func >~ <T: AxisAnchor, U: AxisAnchor>(lhs: T, rhs: U) -> NSLayoutConstraint where T.AnchorType == U.AnchorType {
    return (lhs >= rhs).activate()
}

// Dimension to dimension

@discardableResult public func ~ (lhs: DimensionAnchor, rhs: DimensionAnchor) -> NSLayoutConstraint {
    return (lhs == rhs).activate()
}

@discardableResult public func >~ (dimension: DimensionAnchor, rhs: DimensionAnchor) -> NSLayoutConstraint {
    return (dimension >= rhs).activate()
}

@discardableResult public func <~ (dimension: DimensionAnchor, rhs: DimensionAnchor) -> NSLayoutConstraint {
    return (dimension <= rhs).activate()
}

// Dimension to constant

@discardableResult public func >~ (dimension: DimensionAnchor, constant: CGFloat) -> NSLayoutConstraint {
    return (dimension >= constant).activate()
}

@discardableResult public func <~ (dimension: DimensionAnchor, constant: CGFloat) -> NSLayoutConstraint {
    return (dimension <= constant).activate()
}

@discardableResult public func ~ (dimension: DimensionAnchor, constant: CGFloat) -> NSLayoutConstraint {
    return (dimension == constant).activate()
}

// priorities

@discardableResult public func >~ (dimension: DimensionAnchor, constant: PrioritizedConstant) -> NSLayoutConstraint {
    return (dimension >= constant).activate()
}

@discardableResult public func <~ (dimension: DimensionAnchor, constant: PrioritizedConstant) -> NSLayoutConstraint {
    return (dimension <= constant).activate()
}

@discardableResult public func ~ (dimension: DimensionAnchor, constant: PrioritizedConstant) -> NSLayoutConstraint {
    return (dimension == constant).activate()
}
