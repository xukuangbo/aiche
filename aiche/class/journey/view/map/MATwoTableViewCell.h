//
//  MATwoTableViewCell.h
//  爱车
//
//  Created by mayingbing on 16/3/27.
//  Copyright © 2016年 aiche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MACellMapView.h"

@interface MATwoTableViewCell : UITableViewCell

@property(nonatomic ,strong)MACellMapView *mapView;

+(instancetype)creatCellWithTableView:(UITableView *)tableView;

@end
