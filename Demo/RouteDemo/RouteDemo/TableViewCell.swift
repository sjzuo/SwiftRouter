//
//  TableViewCell.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/26.
//

import UIKit

class TableViewCell: UITableViewCell {

    public var titleStr: String = "" {
        didSet {
            titleLabel.text = titleStr
        }
    }
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        var titleRect = contentView.bounds
        titleRect.origin.x = 20
        
        titleLabel.frame = titleRect
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
