# RAC_1-1


##### Subscription

订阅者
热信号

冷信号

```
 __block unsigned subscriptions = 0;
    RACSignal * loginSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
        subscriptions ++;
//        [subscriber sendNext:nil];
        [subscriber sendCompleted];
        return nil;
    }];
    
    [loginSignal subscribeCompleted:^{
        NSLog(@"subscription %u", subscriptions);
    }];
    
    [loginSignal subscribeCompleted:^{
        NSLog(@"subscription %u", subscriptions);
    }];


out put :

2016-10-02 16:58:56.938 RAC_1-1[46719:236962] subscription 1
2016-10-02 16:58:58.578 RAC_1-1[46719:236962] subscription 2
```

### Transforming streams

#####  map

```
    NSArray * nums = @[@(7),@(9),@(1),@(2),@(3),@(6),@(10)];
    RACSequence * numSequence = [nums rac_sequence];
    RACSequence * mapSequence = [numSequence map:^id(id x){
        return @([(NSNumber *)x intValue] * 10);
    }];
    
    [[mapSequence signal] subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
    
    输出:
2016-10-02 17:11:54.827 RAC_1-1[47184:245027] 70
2016-10-02 17:11:54.829 RAC_1-1[47184:245027] 90
2016-10-02 17:11:54.830 RAC_1-1[47184:245027] 10
2016-10-02 17:11:54.831 RAC_1-1[47184:245027] 20
2016-10-02 17:11:54.831 RAC_1-1[47184:245027] 30
2016-10-02 17:11:54.832 RAC_1-1[47184:245027] 60
2016-10-02 17:11:54.833 RAC_1-1[47184:245027] 100

```


#### filter
过滤操作

```
    NSArray * nums = @[@(7),@(9),@(1),@(2),@(3),@(6),@(10)];
    RACSequence * numSequence = [nums rac_sequence];
    RACSequence * mapSequence = [numSequence filter:^BOOL(id value){
        return ([(NSNumber *)value intValue] > 4);
    }];
    
    [[mapSequence signal] subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
    输出:
    2016-10-02 17:14:17.642 RAC_1-1[47265:246460] 7
2016-10-02 17:14:17.643 RAC_1-1[47265:246460] 9
2016-10-02 17:14:17.644 RAC_1-1[47265:246460] 6
2016-10-02 17:14:17.644 RAC_1-1[47265:246460] 10
    
```


### Combining streams

事物叫合并  信号叫联合
#### Concatenating  合并

```
 RACSubject * subject = [[RACSubject alloc] init];
    [[subject filter:^BOOL(NSString * x){
        if ([x isEqualToString:@"123"]) {
            return YES;
        }
        return NO;
    }] subscribeNext:^(id x){
        NSLog(@"this is true val : %@",x);
    }];
    
    [subject sendNext:@"123" ];
    输出：
    2016-10-02 17:27:10.096 RAC_1-1[47411:253513] a
2016-10-02 17:27:10.097 RAC_1-1[47411:253513] b
2016-10-02 17:27:10.097 RAC_1-1[47411:253513] c
2016-10-02 17:27:10.098 RAC_1-1[47411:253513] 1
2016-10-02 17:27:10.099 RAC_1-1[47411:253513] 2
2016-10-02 17:27:10.099 RAC_1-1[47411:253513] 3
```

#### Flattening （压缩）

sequence 压缩

```
    NSArray * abcs = @[@"a",@"b",@"c"];
    NSArray * nums = @[@"1",@"2",@"3"];
    
    RACSequence * seqs = @[abcs.rac_sequence,nums.rac_sequence].rac_sequence;
    
    RACSequence * flatten = [seqs flatten];
    
    [[flatten signal] subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
    
    输出：
    2016-10-03 10:19:24.846 RAC_1-1[1393:25357] a
2016-10-03 10:19:24.847 RAC_1-1[1393:25357] b
2016-10-03 10:19:24.847 RAC_1-1[1393:25357] c
2016-10-03 10:19:24.847 RAC_1-1[1393:25357] 1
2016-10-03 10:19:24.848 RAC_1-1[1393:25357] 2
2016-10-03 10:19:24.848 RAC_1-1[1393:25357] 3
```

信号压缩

```
    RACSubject * letters = [RACSubject subject];
    RACSubject * numbers = [RACSubject subject];
    RACSignal * signalOfSignals = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
        [subscriber sendNext:letters];
        [subscriber sendNext:numbers];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal * flattendes = [signalOfSignals flatten];
    [flattendes subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
    
    [letters sendNext:@"A"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"Aa"];
    [letters sendNext:@"B"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"2"];
    
    输出：
2016-10-03 10:47:31.691 RAC_1-1[1630:36187] A
2016-10-03 10:47:31.691 RAC_1-1[1630:36187] 1
2016-10-03 10:47:31.691 RAC_1-1[1630:36187] Aa
2016-10-03 10:47:31.692 RAC_1-1[1630:36187] B
2016-10-03 10:47:31.692 RAC_1-1[1630:36187] C
2016-10-03 10:47:31.692 RAC_1-1[1630:36187] 2

```

##### Mapping and flattening 匹配压缩

```
    RACSequence  * numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;
    
    RACSequence * extended = [numbers flattenMap:^(NSString *num){
        return @[num,num].rac_sequence;
    }];
    
    RACSequence *edited = [numbers flattenMap:^(NSString *num){
        if (num.intValue % 2 == 0) {
            return [RACSequence empty];
        } else {
            NSString *newNum = [num stringByAppendingString:@"_"];
            return [RACSequence return:newNum];
        }
    }];

    [[edited signal] subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];
    输出：
    2016-10-03 15:03:21.469 RAC_1-1[1872:107086] 1_
2016-10-03 15:03:21.470 RAC_1-1[1872:107086] 3_
2016-10-03 15:03:21.470 RAC_1-1[1872:107086] 5_
2016-10-03 15:03:21.470 RAC_1-1[1872:107086] 7_
2016-10-03 15:03:21.471 RAC_1-1[1872:107086] 9_

```





#### merge signal

```
 RACSubject * subA = [[RACSubject alloc] init];
    RACSubject * subB = [[RACSubject alloc] init];

    RACSignal * merge = [RACSignal merge:@[subA,subB]];
    
    [merge subscribeNext:^(id x){
        NSLog(@"merge:%@",x);
    }];
    
    [subA sendNext:@"a"];
    [subB sendNext:@"b"];
    [subA sendNext:@"a1"];
    [subB sendNext:@"b1"];
    
    输出：
    2016-10-03 16:21:19.711 RAC_1-1[31188:187307] merge:a
2016-10-03 16:21:19.712 RAC_1-1[31188:187307] merge:b
2016-10-03 16:21:19.712 RAC_1-1[31188:187307] merge:a1
2016-10-03 16:21:19.713 RAC_1-1[31188:187307] merge:b1
```

##### Combining latest values

```
    RACSubject * subA = [[RACSubject alloc] init];
    RACSubject * subB = [[RACSubject alloc] init];
    
    RACSignal * combined = [RACSignal combineLatest:@[subA,subB] reduce:^(NSString *letter, NSString *number){
        return [letter stringByAppendingString:number];
    }];
    
    [combined subscribeNext:^(id x){
        NSLog(@"merge:%@",x);
    }];
    
    [subA sendNext:@"A"];
    [subA sendNext:@"B"];
    [subB sendNext:@"1"];
    [subB sendNext:@"2"];
    [subA sendNext:@"C"];
    [subB sendNext:@"3"];
    
    输出：
2016-10-03 16:25:12.918 RAC_1-1[31266:189697] merge:B1
2016-10-03 16:25:12.920 RAC_1-1[31266:189697] merge:B2
2016-10-03 16:25:12.920 RAC_1-1[31266:189697] merge:C2
2016-10-03 16:25:12.920 RAC_1-1[31266:189697] merge:C3
```

##### Switching

```
    RACSubject * letter = [RACSubject subject];
    RACSubject * number = [RACSubject subject];
    
    RACSubject * signalOfSignals = [RACSubject subject];
    
    RACSignal * switched = [signalOfSignals switchToLatest];
    
    [switched subscribeNext:^(id x){
        NSLog(@"switched : %@",x);
    }];
    
    [signalOfSignals sendNext:letter];
    [letter sendNext:@"L_A_1"];
    [letter sendNext:@"L_A_2"];
    
    [signalOfSignals sendNext:number];
    [letter sendNext:@"L_B_1"];
    [number sendNext:@"N_B_2"];
    
    [signalOfSignals sendNext:letter];
    [number sendNext:@"N_C_1"];
    [letter sendNext:@"L_C_2"];
    输出：
    2016-10-03 16:34:02.678 RAC_1-1[31488:194872] switched : L_A_1
2016-10-03 16:34:02.679 RAC_1-1[31488:194872] switched : L_A_2
2016-10-03 16:34:02.679 RAC_1-1[31488:194872] switched : N_B_2
2016-10-03 16:34:02.679 RAC_1-1[31488:194872] switched : L_C_2

``


##### RACSingle

##### RACSubject


##### RACSequence
Sequence 类似于NSArray 

```
NSArray *array2 = @[@"a",@"b",@"c",];
    RACSignal * arrat2Single = [array2.rac_sequence signal];
    [arrat2Single subscribeNext:^(id x){
        NSLog(@"%@",x);
    }];

log:a
	b
	c
```