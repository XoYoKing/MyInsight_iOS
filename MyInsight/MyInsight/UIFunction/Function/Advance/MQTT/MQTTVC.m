//
//  MQTTVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/2/28.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "MQTTVC.h"
#import <MQTTClient/MQTTClient.h>

#define MQTTHost @"127.0.0.1" // 设置服务器地址
#define MQTTPort 1883 // 设置服务器端口 默认:1883

@interface MQTTVC ()<MQTTSessionDelegate>

@property (nonatomic, strong) MQTTSession *session;

@end

@implementation MQTTVC

/*
 [(iOS)MQTT连接 遗嘱 双向认证](https://www.jianshu.com/p/4676834ac3c4)
 [iOS MQTT----MQTTClient实战-看这篇的就够了](https://www.jianshu.com/p/80ea4507ca74)
 [Apollo-mqtt](https://github.com/ReReReReReRe/Apollo-mqtt)
 
 [开始使用 (Get Started)](http://emqtt.com/docs/v2/getstarted.html)
 */

- (void)viewDidLoad {
  
    [super viewDidLoad];
    
    self.title = @"MQTT";
    
    // 创建一个传输对象
    MQTTCFSocketTransport *transport = [[MQTTCFSocketTransport alloc] init];
    // IP
    transport.host = MQTTHost;
    // 端口
    transport.port = MQTTPort;
    // 会话
    self.session = [[MQTTSession alloc] init]; // 初始化
    self.session.transport = transport;
    self.session.delegate = self;
}

#pragma mark - 实现Session代理方法 处理数据
- (void)newMessage:(MQTTSession *)session data:(NSData *)data onTopic:(NSString *)topic qos:(MQTTQosLevel)qos retained:(BOOL)retained mid:(unsigned int)mid {
    NSLog(@"LALALALALA: %@", data);
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
