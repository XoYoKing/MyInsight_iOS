//
//  RSAEncryptVC.m
//  MyInsight
//
//  Created by SongMengLong on 2018/4/25.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "RSAEncryptVC.h"
#import <Masonry.h>
#import "UIColor+Category.h"
#import "RSA.h"

@interface RSAEncryptVC ()
// 选择类型button
@property (nonatomic, strong) UIButton *typeButton;
// 加密内容输入
@property (nonatomic, strong) UITextField *encryptText;
// 加密button
@property (nonatomic, strong) UIButton *encryptButton;
// 解密内容输入
@property (nonatomic, strong) UITextField *decryptText;
// 解密button
@property (nonatomic, strong) UIButton *decryptButton;

@end

@implementation RSAEncryptVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"RSAEncrypt加密解密";
    
    [self creatContentView];
    
    [self jiaMiJieMi];
    
    [self masonryLayout];
}

- (void)creatContentView {
    self.typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.typeButton];
    [self.typeButton setTitle:@"选择加密解密类型" forState:UIControlStateNormal];
    self.typeButton.backgroundColor = [UIColor RandomColor];
    
    self.encryptText = [[UITextField alloc] init];
    [self.view addSubview:self.encryptText];
    self.encryptText.placeholder = @"";
    
    
    self.encryptButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.encryptButton];
    
    self.decryptText = [[UITextField alloc] init];
    [self.view addSubview:self.decryptText];
    
    self.decryptButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.decryptButton];
}

#pragma mark - 加密解密
- (void)jiaMiJieMi {
    // https://www.jianshu.com/p/eaaf93a6cc9c
    // iOS开发探索-RSA加解密
    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n-----END PUBLIC KEY-----";
    NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";
    
    NSString *originString = @"hello world!";
    NSString *encWithPubKey;
    NSString *decWithPrivKey;
    NSString *encWithPrivKey;
    NSString *decWithPublicKey;
    
    // Demo: encrypt with public key
    encWithPubKey = [RSA encryptString:originString publicKey:pubkey];
    NSLog(@"Enctypted with public key: %@", encWithPubKey);
    // Demo: decrypt with private key
    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
    NSLog(@"Decrypted with private key: %@", decWithPrivKey);
    
    // Demo: encrypt with public key
    encWithPubKey = [RSA encryptString:originString publicKey:pubkey];
    NSLog(@"Enctypted with public key: %@", encWithPubKey);
    // Demo: decrypt with private key
    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
    NSLog(@"Decrypted with private key: %@", decWithPrivKey);
    
    
    // by PHP
    encWithPubKey = @"CKiZsP8wfKlELNfWNC2G4iLv0RtwmGeHgzHec6aor4HnuOMcYVkxRovNj2r0Iu3ybPxKwiH2EswgBWsi65FOzQJa01uDVcJImU5vLrx1ihJ/PADUVxAMFjVzA3+Clbr2fwyJXW6dbbbymupYpkxRSfF5Gq9KyT+tsAhiSNfU6akgNGh4DENoA2AoKoWhpMEawyIubBSsTdFXtsHK0Ze0Cyde7oI2oh8ePOVHRuce6xYELYzmZY5yhSUoEb4+/44fbVouOCTl66ppUgnR5KjmIvBVEJLBq0SgoZfrGiA3cB08q4hb5EJRW72yPPQNqJxcQTPs8SxXa9js8ZryeSxyrw==";
    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
    NSLog(@"(PHP enc)Decrypted with private key: %@", decWithPrivKey);
    
    // Demo: encrypt with private key
    // TODO: encryption with private key currently NOT WORKING YET!
    //encWithPrivKey = [RSA encryptString:originString privateKey:privkey];
    //NSLog(@"Enctypted with private key: %@", encWithPrivKey);
    
    // Demo: decrypt with public key
    encWithPrivKey = @"aQkSJwaYppc2dOGEOtgPnzLYX1+1apwqJga2Z0k0cVCo7vCqOY58PyVuhp49Z+jHyIEmIyRLsU9WOWYNtPLg8XDnt1WLSst5VNyDlJJehbvm7gbXewxrPrG+ukZgo11GYJyU42DqNr59D3pQak7P2Ho6zFvN0XJ+lnVXJ1NTmgQFQYeFksTZFmJmQ5peHxpJy5XBvqjfYOEdlkeiiPKTnTQaQWKJfC9CRtWfTTYM2VKMBSTB0eNWto5XAu5BvgEgTXzndHGzsWW7pOHLqxVagr0xhNPPCB2DRE5PClE2FD9qNv0JcSMnUJ8bLvk6Yeh7mMDObJ4kBif5G9VnHjTqTg==";
    decWithPublicKey = [RSA decryptString:encWithPrivKey publicKey:pubkey];
    NSLog(@"(PHP enc)Decrypted with public key: %@", decWithPublicKey);
    
}

#pragma mark - 代码约束布局
- (void)masonryLayout {
    // 选择加密解密的类型
    [self.typeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    // 输入加密内容
    [self.encryptText mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    // 点击进行加密
    [self.encryptButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    // 输入解密内容
    [self.decryptText mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    // 点击进行解密
    [self.decryptButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
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
