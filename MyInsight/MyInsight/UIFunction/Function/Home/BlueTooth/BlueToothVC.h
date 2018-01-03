//
//  BlueToothVC.h
//  MyInsight
//
//  Created by SongMenglong on 2017/12/25.
//  Copyright © 2017年 SongMenglong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <CoreBluetooth/CoreBluetooth.h>

@interface BlueToothVC : UITableViewController

// 中心管理者
@property (nonatomic, strong) CBCentralManager *manager;
// 外设
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, strong) CBCharacteristic *characteristicWrite;
@property (nonatomic, strong) CBCharacteristic *characteristicRead;

@end
