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
// 特征数组
@property (nonatomic, strong) NSMutableArray *characteristicsArray;

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

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // 断开蓝牙设备
    [self.centralManager cancelPeripheralConnection:self.peripheral];
}

#pragma mark - 实现代理协议
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"更新状态");
    [self.centralManager scanForPeripheralsWithServices:nil options:nil];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    if ([peripheral.identifier.UUIDString isEqual:self.peripheral.identifier.UUIDString]) {
        // 保存该设备 必须要保存遍历到的设备
        self.peripheral = peripheral;
        // 蓝牙设备设置代理
        peripheral.delegate = self;
        // 连接蓝牙设备
        [central connectPeripheral:peripheral options:nil];
    }
}

// 已经连接设备
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"已经连接设备");
    // 扫描外部设备的服务
    [peripheral discoverServices:nil];
    // 停止扫描
    [central stopScan];
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"连接设备失败 设备：%@ 错误：%@", peripheral, error);
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"断开设备连接 设备：%@ 错误：%@", peripheral, error);
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    //NSLog(@"设备所带的服务：%@", peripheral.services);
    // 遍历设备自带的特征
    for (CBService *service in peripheral.services) {
        // 扫描发现特征 特征设置为空 便可扫描所有
        [peripheral discoverCharacteristics:nil forService:service];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    NSLog(@"服务的特征：%@", service.characteristics);
    // 初始化数组
    if (self.characteristicsArray == NULL) {
        self.characteristicsArray = [[NSMutableArray alloc] init];
    }
    // 遍历特征
    for (CBCharacteristic *characteristic in service.characteristics) {
        if ([self.characteristicsArray containsObject:characteristic] == NO) {
            // 特征数组不包含该特征 就加入到数组
            [self.characteristicsArray addObject:characteristic];
        }
    }
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
