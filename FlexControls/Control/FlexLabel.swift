//
//  FlexLabel.swift
//  FlexControls
//
//  Created by Martin Rehder on 18.09.16.
/*
 * Copyright 2016-present Martin Jacob Rehder.
 * http://www.rehsco.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import UIKit
import StyledLabel

/// This class wraps a StyledLabel and adds features for placement, layout, etc.
@IBDesignable
open class FlexLabel: FlexBaseControl {
    fileprivate lazy var _label = StyledLabelFactory.defaultStyledLabel()

    open var label: StyledLabel {
        get {
            return _label
        }
    }
    
    /// The font of the label
    @IBInspectable dynamic open var labelFont: UIFont? {
        didSet {
            self.applyStyle()
            self.setNeedsLayout()
        }
    }
    
    /// The text alignment of the label
    @IBInspectable dynamic open var labelTextAlignment: NSTextAlignment = .left {
        didSet {
            self.applyStyle()
            self.setNeedsLayout()
        }
    }
    
    /// The text color.
    @IBInspectable dynamic open var labelTextColor: UIColor? {
        didSet {
            self.applyStyle()
            self.setNeedsLayout()
        }
    }
    
    /// The border color.
    @IBInspectable dynamic open var labelBorderColor: UIColor? {
        didSet {
            self.applyStyle()
            self.setNeedsLayout()
        }
    }
    
    /// The border width
    @IBInspectable dynamic open var labelBorderWidth: CGFloat = 1.0 {
        didSet {
            self.applyStyle()
            self.setNeedsLayout()
        }
    }
    
    /// Left offset
    @IBInspectable dynamic open var labelLeftOffset: CGFloat = 0.0 {
        didSet {
            self.applyStyle()
            self.setNeedsLayout()
        }
    }
    
    /// Right offset
    @IBInspectable dynamic open var labelRightOffset: CGFloat = 0.0 {
        didSet {
            self.applyStyle()
            self.setNeedsLayout()
        }
    }
    
    override open func applyStyle(_ style: ShapeStyle) {
        if self.label.superview == nil {
            self.addSubview(self.label)
        }
        self.label.style = style
        self.label.backgroundColor = styleColor
        self.label.borderColor = labelBorderColor
        self.label.borderWidth = labelBorderWidth
        if let tcolor = self.labelTextColor {
            self.label.textColor = tcolor
        }
        if let font = self.labelFont {
            self.label.font = font
        }
        self.label.textAlignment = labelTextAlignment
        
        self.label.frame = self.bounds.inset(by: UIEdgeInsets.init(top: 0, left: self.labelLeftOffset, bottom: 0, right: self.labelRightOffset))
    }
    
    open func applyStyle() {
        self.applyStyle(self.getStyle())
    }
}
