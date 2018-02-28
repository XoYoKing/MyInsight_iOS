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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MQTT";
    self.view.backgroundColor = [UIColor whiteColor];
    
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


/*
 断开连接
 */


/*
 关闭
 */


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
