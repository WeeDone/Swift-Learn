//
//  SQCellTableViewCell.swift
//  SQCodeCell
//
//  Created by XinJinquan on 2016/1/20.
//  Copyright © 2016年 XinJinquan. All rights reserved.
//

import UIKit

class SQCellTableViewCell: UITableViewCell {

    var label :UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let width = UIScreen.mainScreen().bounds.size.width
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        label?.textColor = UIColor.whiteColor()
        label?.backgroundColor = UIColor.blueColor()
        self.contentView.addSubview(label!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
