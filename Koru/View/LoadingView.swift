/* 

=========================================================================== 
Koru GPL Source Code 
Copyright (C) 2017 Tekton Labs
This file is part of the Koru GPL Source Code.
Koru Source Code is free software: you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation, either version 3 of the License, or 
(at your option) any later version. 

Koru Source Code is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
GNU General Public License for more details. 

You should have received a copy of the GNU General Public License 
along with Koru Source Code. If not, see <http://www.gnu.org/licenses/>. 
=========================================================================== 

*/

import UIKit

class LoadingView: UIView {
    static let loadingViewHeight: CGFloat = 40
    private var activitySpinner: UIActivityIndicatorView
    

    override init(frame: CGRect) {
        activitySpinner = UIActivityIndicatorView()
        super.init(frame: frame)
    
        setupActivityIndicator()
        setupConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        activitySpinner = UIActivityIndicatorView()
        super.init(coder: aDecoder)
       
        setupActivityIndicator()
        setupConstraint()
    }

    private func setupActivityIndicator() {
        activitySpinner.startAnimating()
        activitySpinner.activityIndicatorViewStyle = .gray
        activitySpinner.hidesWhenStopped = true
    }

    private func setupConstraint() {
    
        activitySpinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activitySpinner)
        NSLayoutConstraint(item: activitySpinner, attribute: .centerX, relatedBy: .equal, toItem:   self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: activitySpinner, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
}
