//
//  TextCellTableViewCell.swift
//  Animations
//
//  Created by Cyril on 15/04/17.
//  Copyright © 2017 Cyril. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

    
    @IBOutlet var cellTextLabel: UILabel!
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var bgView: UIView!
    @IBOutlet var bottomImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellImageView.image = UIImage(named: "iMac")!
        self.cellImageView.contentMode = .scaleAspectFit
        self.bottomImage.image = UIImage(named: "iMac")!
        self.bottomImage.contentMode = .scaleAspectFit
        self.bgView.backgroundColor = .white
        self.cellTextLabel.text = "Lorem Ipsum je demonstrativní výplňový text používaný v tiskařském a knihařském průmyslu. Lorem Ipsum je považováno za standard v této oblasti už od začátku 16. stoleti. "
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
