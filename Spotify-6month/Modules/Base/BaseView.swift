//
//  BaseView.swift
//  Spotify-6month
//
//  Created by Telegey Nurbekova on 21/07/24.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() { }
    
    func setUpConstraints() { }
}
