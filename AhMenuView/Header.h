//
//  Header.h
//  AhMenuView
//
//  Created by ah on 16/2/3.
//  Copyright © 2016年 ah. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define AHColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define AHRandomColor AHColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define K_Screen_Width [UIScreen mainScreen].bounds.size.width
#define K_Screen_Height [UIScreen mainScreen].bounds.size.height
#endif /* Header_h */
