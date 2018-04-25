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

// 加密的枚举值
/*
 MD5加密 DES加密 AES加密 RSA加密 RSA&JavaServer加密
 */
typedef NS_ENUM(NSUInteger, EncryptType) {
    EncryptTypeMD5 = 0,
    EncryptTypeDES,
    EncryptTypeAES,
    EncryptTypeRSA,
    EncryptTypeRSA_JAVA,
};

@interface RSAEncryptVC ()
// 选择类型button
@property (nonatomic, strong) UILabel *typeLabel;
// 选择类型button
@property (nonatomic, strong) UIButton *typeButton;
// 原始数据标题
@property (nonatomic, strong) UILabel *originLabel;
// 原始数据
@property (nonatomic, strong) UITextField *originTextField;
// 加密标题
@property (nonatomic, strong) UILabel *encryptLabel;
// 加密内容输入
@property (nonatomic, strong) UITextView *encryptTextView;
// 解密标题
@property (nonatomic, strong) UILabel *decryptLabel;
// 解密内容输入
@property (nonatomic, strong) UITextView *decryptTextView;
// 加密button
@property (nonatomic, strong) UIButton *encryptButton;
// 解密button
@property (nonatomic, strong) UIButton *decryptButton;

@property (nonatomic, assign) EncryptType encryptType;

@end

@implementation RSAEncryptVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"RSAEncrypt加密解密";
    
    [self creatContentView];
    
    //[self jiaMiJieMi];
    
    [self masonryLayout];
}

- (void)creatContentView {
    self.view.backgroundColor = [UIColor RandomColor];
    // 选择类型Label
    self.typeLabel = [[UILabel alloc] init];
    [self.view addSubview:self.typeLabel];
    self.typeLabel.backgroundColor = [UIColor RandomColor];
    self.typeLabel.text = @"选择加密解密类型";
    
    // 选择类型Button
    self.typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.typeButton];
    [self.typeButton setTitle:@"选择加密解密类型" forState:UIControlStateNormal];
    self.typeButton.backgroundColor = [UIColor RandomColor];
    [self.typeButton addTarget:self action:@selector(typeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 原始数据Label
    self.originLabel = [[UILabel alloc] init];
    [self.view addSubview:self.originLabel];
    self.originLabel.backgroundColor = [UIColor RandomColor];
    self.originLabel.text = @"原始数据";
    
    //原始数据输入框
    self.originTextField = [[UITextField alloc] init];
    [self.view addSubview:self.originTextField];
    self.originTextField.backgroundColor = [UIColor RandomColor]; // 随机颜色
    self.originTextField.placeholder = @"请输入原始数据";
    
    // 生成加密数据Label
    self.encryptLabel = [[UILabel alloc] init];
    [self.view addSubview:self.encryptLabel];
    self.encryptLabel.backgroundColor = [UIColor RandomColor];
    self.encryptLabel.text = @"加密数据";
    
    // 生成加密数据TextView
    self.encryptTextView = [[UITextView alloc] init];
    [self.view addSubview:self.encryptTextView];
    self.encryptTextView.backgroundColor = [UIColor RandomColor];
    
    // 生成解密数据Label
    self.decryptLabel = [[UILabel alloc] init];
    [self.view addSubview:self.decryptLabel];
    self.decryptLabel.backgroundColor = [UIColor RandomColor];
    self.decryptLabel.text = @"解密数据";
    
    // 生成解密数据TextView
    self.decryptTextView = [[UITextView alloc] init];
    [self.view addSubview:self.decryptTextView];
    self.decryptTextView.backgroundColor = [UIColor RandomColor];
    
    // 生成加密数据Button
    self.encryptButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.encryptButton];
    self.encryptButton.backgroundColor = [UIColor RandomColor];
    [self.encryptButton setTitle:@"生成密文" forState:UIControlStateNormal];
    [self.encryptButton addTarget:self action:@selector(encryptButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 生成解密数据Button
    self.decryptButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.decryptButton];
    self.decryptButton.backgroundColor = [UIColor RandomColor];
    [self.decryptButton setTitle:@"解密密文" forState:UIControlStateNormal];
    [self.decryptButton addTarget:self action:@selector(decryptButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Button的事件
- (void)typeButtonAction:(UIButton *)button {
    NSLog(@"选择类型方法");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择加密类型" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // MD5加密 DES加密 AES加密 RSA加密 RSA&JavaServer加密
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:@"BASE64加密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeButton setTitle:@"BASE64加密" forState:UIControlStateNormal];
        self.encryptType = EncryptTypeMD5;
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"MD5加密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeButton setTitle:@"MD5加密" forState:UIControlStateNormal];
        self.encryptType = EncryptTypeMD5;
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"DES加密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeButton setTitle:@"DES加密" forState:UIControlStateNormal];
        self.encryptType = EncryptTypeDES;
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"AES加密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeButton setTitle:@"AES加密" forState:UIControlStateNormal];
        self.encryptType = EncryptTypeAES;
    }];
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"RSA加密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeButton setTitle:@"RSA加密" forState:UIControlStateNormal];
        self.encryptType = EncryptTypeRSA;
    }];
    UIAlertAction *action5 = [UIAlertAction actionWithTitle:@"RSA&JavaServer加密" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeButton setTitle:@"RSA&JavaServer加密" forState:UIControlStateNormal];
        self.encryptType = EncryptTypeRSA_JAVA;
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:action0];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController addAction:action3];
    [alertController addAction:action4];
    [alertController addAction:action5];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:NULL];
}

// 加密
- (void)encryptButtonAction:(UIButton *)button {
    NSLog(@"加密button动作方法");
    if (self.encryptType == 0) {
        self.encryptType = EncryptTypeMD5; // 默认
        [self.typeButton setTitle:@"MD5加密" forState:UIControlStateNormal];
    }
    
}

// 解密
- (void)decryptButtonAction:(UIButton *)button {
    NSLog(@"解密button动作方法");
    if (self.encryptType == 0) {
        self.encryptType = EncryptTypeMD5; // 默认
        [self.typeButton setTitle:@"MD5加密" forState:UIControlStateNormal];
    }
    
}


/**************         MD5加密方法        ***************/



#pragma mark - 代码约束布局
- (void)masonryLayout {
    // 选择类型Label
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20.0f+64.0f);
        make.left.equalTo(self.view.mas_left).offset(20.0f);
        make.width.offset(150.0f);
        make.height.offset(40.0f);
    }];
    // 选择加密解密的类型
    [self.typeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20.0f+64.0f);
        make.left.equalTo(self.typeLabel.mas_right).offset(20.0f);
        make.right.equalTo(self.view.mas_right).offset(-20.0f);
        make.height.offset(40.0f);
    }];
    // 原始数据Label
    [self.originLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(20.0f);
        make.left.equalTo(self.view.mas_left).offset(20.0f);
        make.width.offset(150.0f);
        make.height.offset(40.0f);
    }];
    // 原始数据输入框
    [self.originTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(20.0f);
        make.left.equalTo(self.originLabel.mas_right).offset(20.0f);
        make.right.equalTo(self.view.mas_right).offset(-20.0f);
        make.height.offset(40.0f);
    }];
    // 生成加密数据Label
    [self.encryptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.originTextField.mas_bottom).offset(20.0f);
        make.left.equalTo(self.view.mas_left).offset(20.0f);
        make.right.equalTo(self.view.mas_right).offset(-20.0f);
        make.height.offset(40.0f);
    }];
    // 生成加密内容
    [self.encryptTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.encryptLabel.mas_bottom).offset(20.0f);
        make.left.equalTo(self.view.mas_left).offset(20.0f);
        make.right.equalTo(self.view.mas_right).offset(-20.0f);
    }];
    // 生成解密数据Label
    [self.decryptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.encryptTextView.mas_bottom).offset(20.0f);
        make.left.equalTo(self.view.mas_left).offset(20.0f);
        make.right.equalTo(self.view.mas_right).offset(-20.0f);
        make.height.offset(40.0f);
    }];
    // 生成解密内容
    [self.decryptTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.decryptLabel.mas_bottom).offset(20.0f);
        make.left.equalTo(self.view.mas_left).offset(20.0f);
        make.right.equalTo(self.view.mas_right).offset(-20.0f);
        make.height.equalTo(self.encryptTextView.mas_height).multipliedBy(1.0f);
    }];
    // 点击进行加密
    [self.encryptButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.decryptTextView.mas_bottom).offset(20.0f);
        make.left.equalTo(self.view.mas_left).offset(20.0f);
        make.height.offset(40.0f);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20.0f);
    }];
    // 点击进行解密
    [self.decryptButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.encryptButton.mas_top).offset(0.0f);
        make.left.equalTo(self.encryptButton.mas_right).offset(20.0f);
        make.right.equalTo(self.view.mas_right).offset(-20.0f);
        make.bottom.equalTo(self.encryptButton.mas_bottom).offset(0.0f);
        make.width.equalTo(self.encryptButton.mas_width).multipliedBy(1.0f);
    }];
}

#pragma mark - 加密解密
- (void)jiaMiJieMi {
    // 教程
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
