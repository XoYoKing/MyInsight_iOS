//
//  BlueToothDataVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/5/17.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "BlueToothDataVC.h"

@interface BlueToothDataVC ()<CBCentralManagerDelegate, CBPeripheralDelegate>
// 中心管理者
@property (nonatomic, strong) CBCentralManager *centralManager;
// 特征写
@property (nonatomic, strong) CBCharacteristic *characteristicWrite;
// 特征读
@property (nonatomic, strong) CBCharacteristic *characteristicRead;

@end

/*
 [iOS开发之蓝牙通讯](https://my.oschina.net/u/2340880/blog/548127)
 [iOS之蓝牙开发—CoreBluetooth详解](https://www.cnblogs.com/allencelee/p/6707901.html)
 */

@implementation BlueToothDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"蓝牙设备内容";
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
    
}

#pragma mark - 实现代理协议
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"更新状态");
    [self.centralManager scanForPeripheralsWithServices:nil options:nil];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    NSLog(@"%@ %@ %@", peripheral, advertisementData, RSSI);
    
    if ([peripheral.identifier.UUIDString isEqual:self.peripheral.identifier.UUIDString]) {
        // 连接设备
        peripheral.delegate = self;
        [central connectPeripheral:peripheral options:nil];
    }
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"已经连接设备");
    // 扫描外部设备的服务
    [peripheral discoverServices:nil];
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"连接设备失败");
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"断开设备连接");
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    // 遍历设备自带的特征
    for (CBService *service in peripheral.services) {
        // 扫描发现特征 特征设置为空 便可扫描所有
        [peripheral discoverCharacteristics:nil forService:service];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
