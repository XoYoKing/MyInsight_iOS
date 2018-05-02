//
//  MQTTVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/2/28.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "MQTTVC.h"
#import <MQTTClient/MQTTClient.h>

@interface MQTTVC ()

@end

@implementation MQTTVC

/*
 [(iOS)MQTT连接 遗嘱 双向认证](https://www.jianshu.com/p/4676834ac3c4)
 [iOS MQTT----MQTTClient实战-看这篇的就够了](https://www.jianshu.com/p/80ea4507ca74)
 [Apollo-mqtt](https://github.com/ReReReReReRe/Apollo-mqtt)
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MQTT";
    
    // 创建一个传输对象
    //MQTTCFSocketTransport *transport = [[MQTTCFSocketTransport alloc] init];
    // IP
//    transport.host = TFHOST;
//    // 端口
//    transport.port = TFPORT;
//    // 会话
//    MQTTSession *session = [[MQTTSession alloc] init];
//    self.session = session;
//    session.transport = transport;
//    session.delegate = self;
    //
    
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
