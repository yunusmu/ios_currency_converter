//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Joseph on 12/04/2017.
//  Copyright © 2017 Joseph Apps. All rights reserved.
//

#import "ViewController.h"
#import <CurrencyRequest/CRCurrencyRequest.h>
#import <CurrencyRequest/CRCurrencyResults.h>

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *currencyRequest;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *eurLabel;
@property (weak, nonatomic) IBOutlet UILabel *czkLabel;
@property (weak, nonatomic) IBOutlet UILabel *sekLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouched:(id)sender {
    
    self.convertButton.enabled = NO;
    self.currencyRequest = [[CRCurrencyRequest alloc] init];
    [self.currencyRequest setDelegate:self];
    [self.currencyRequest start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    
    double inputValue = [self.inputField.text doubleValue];
    double eurValue = inputValue * currencies.EUR;
    double czkValue = inputValue * currencies.CZK;
    double sekValue = inputValue * currencies.SEK;
    
    self.eurLabel.text = [NSString stringWithFormat:@"%.2f", eurValue];
    self.czkLabel.text = [NSString stringWithFormat:@"%.2f", czkValue];
    self.sekLabel.text = [NSString stringWithFormat:@"%.2f", sekValue];
    
    self.convertButton.enabled = YES;
}

@end
