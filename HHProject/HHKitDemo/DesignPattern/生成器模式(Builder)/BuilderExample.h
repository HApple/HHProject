//
//  BuilderExample.h
//  HHProject
//
//  Created by huang on 2018/9/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

// <http://ibloodline.com/articles/2016/09/18/Builder.html >

/**
 生成器模式
 生成器模式(Builder) : 将一个复杂对象的创建与它的表现分离，使得同样的构建过程可以创建不同的表现。
 
 有时，构建某些对象有多种不同方式。如果这些逻辑包含在构建这些对象的类的单
 一方法中，代码将会充满条件判断。如果能把构建过程分解为 客户-指导者-生成器(client-director-builder)
 的关系，那么过程将更容易管理与服用。针对此类关系的设计模式成为生成器。
 
 */

@interface BuilderExample : NSObject

@end


@interface Character : NSObject

@property (nonatomic,assign) float protection;//防御
@property (nonatomic,assign) float power;//攻击
@property (nonatomic,assign) float strength;//力量
@property (nonatomic,assign) float stamina;//耐力
@property (nonatomic,assign) float intelligence;//智利
@property (nonatomic,assign) float agility;//敏捷
@property (nonatomic,assign) float aggressiveness;//攻击力

@end

// Character的实例不知道如何把自己构建成有意义的角色，所以才需要
// CharacterBuilder 基于先前定义的特征关系，构建有意义的角色



/**
 CharacterBuilder 的实例有个对目标 Character 的引用，该目标 Character 构建
 完成后将被返回给客户端。 有几个构建角色的方法，构建的角色具有特定的力量、耐力、智力、
 敏捷与攻击力值。这些值影响防御和攻击因子。抽象的 CharacterBuilder 定义了默认行为，
 他把这些值设定给目标 Character .
 
 */

@interface CharacterBuilder : NSObject
@property (nonatomic,strong) Character *character;

- (CharacterBuilder *)buildNewChapteracter;
- (CharacterBuilder *)buildStrength:(float)value;
- (CharacterBuilder *)buildStamina:(float)value;
- (CharacterBuilder *)buildIntelligence:(float)value;
- (CharacterBuilder *)buildAgility:(float)value;
- (CharacterBuilder *)buildAggressiveness:(float)value;

@end


@interface StandardCharacterBuilder : CharacterBuilder

- (CharacterBuilder *)buildStrength:(float)value;
- (CharacterBuilder *)buildStamina:(float)value;
- (CharacterBuilder *)buildIntelligence:(float)value;
- (CharacterBuilder *)buildAgility:(float)value;
- (CharacterBuilder *)buildAggressiveness:(float)value;

@end


@interface ChasingGame : NSObject

- (Character *)createPlayer:(CharacterBuilder *)builder;
- (Character *)createEnemy:(CharacterBuilder *)builder;

@end









