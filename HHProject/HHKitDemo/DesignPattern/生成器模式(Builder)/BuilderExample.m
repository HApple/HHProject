//
//  BuilderExample.m
//  HHProject
//
//  Created by huang on 2018/9/11.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "BuilderExample.h"

@implementation BuilderExample
- (instancetype)init{
    self = [super init];
    if(self){
        
        ChasingGame *game = [[ChasingGame alloc] init];
        CharacterBuilder *characterBuilder = [[StandardCharacterBuilder alloc] init];
        Character *player = [game createPlayer:characterBuilder];
        Character *enemy = [game createEnemy:characterBuilder];
        
        NSLog(@"%@",player);
        NSLog(@"%@",enemy);
        
    }
    return self;
}
@end

@implementation Character
- (instancetype)init{
    self = [super init];
    if(self){
        self.protection = 1.f;
        self.power = 1.f;
        self.strength = 1.f;
        self.stamina = 1.f;
        self.intelligence = 1.f;
        self.agility = 1.f;
        self.aggressiveness = 1.f;
    }
    return self;
}
@end

/**
CharacterBuilder 的实例有个对目标 Character 的引用，该目标 Character 构建
 完成后将被返回给客户端。有几个构建角色的方法，构建的角色具有特定的力量
 耐力 智力 敏捷与攻击力值。这些值影响防御和攻击因子。 抽象的
 CharacterBuilder定义了默认行为，他把这些值设定给目标 Character.
 */
@implementation CharacterBuilder
- (CharacterBuilder *)buildNewChapteracter{
    self.character = [[Character alloc] init];
    return self;
}
- (CharacterBuilder *)buildStrength:(float)value{
    self.character.strength = value;
    return self;
}
- (CharacterBuilder *)buildStamina:(float)value{
    self.character.stamina = value;
    return self;
}
- (CharacterBuilder *)buildIntelligence:(float)value{
    self.character.intelligence = value;
    return self;
}
- (CharacterBuilder *)buildAgility:(float)value{
    self.character.agility = value;
    return self;
}
- (CharacterBuilder *)buildAggressiveness:(float)value{
    self.character.aggressiveness = value;
    return self;
}
@end


@implementation StandardCharacterBuilder
- (CharacterBuilder *)buildStrength:(float)value{
    self.character.protection *= value; //更新角色的防御值
    self.character.power *= value; //更新角色的攻击值
    return [super buildStrength:value];//设定力量并返回此生成器
}
- (CharacterBuilder *)buildStamina:(float)value {
    self.character.protection *= value;//更新角色的防御值
    self.character.power *= value;//更新角色的攻击值
    return [super buildStamina:value];//设定耐力并返回此生成器
}
- (CharacterBuilder *)buildIntelligence:(float)value {
    self.character.protection *= value;//更新角色的防御值
    self.character.power /= value;//更新角色的攻击值
    return [super buildIntelligence:value];//设定智力并返回此生成器
}
- (CharacterBuilder *)buildAgility:(float)value {
    self.character.protection *= value;//更新角色的防御值
    self.character.power /= value;//更新角色的攻击值
    return [super buildAgility:value];//设定敏捷并返回此生成器
}
- (CharacterBuilder *)buildAggressiveness:(float)value {
    self.character.protection /= value;//更新角色的防御值
    self.character.power *= value;//更新角色的攻击值
    return [super buildAgility:value];//设定攻击力并返回此生成器
}
@end


@implementation ChasingGame
- (Character *)createPlayer:(CharacterBuilder *)builder{
    [builder buildNewChapteracter];
    [builder buildStrength:50.0];
    [builder buildStamina:25.0];
    [builder buildIntelligence:75.0];
    [builder buildAgility:65.0];
    [builder buildAggressiveness:35.0];
    
    return [builder character];
}


-(Character *)createEnemy:(CharacterBuilder *)builder{
    [builder buildNewChapteracter];
    [builder buildStrength:80.0];
    [builder buildStamina:65.0];
    [builder buildIntelligence:35.0];
    [builder buildAgility:25.0];
    [builder buildAggressiveness:95.0];
    
    return [builder character];
}
@end







