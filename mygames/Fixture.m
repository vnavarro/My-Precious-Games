//
//  Fixture.m
//  bookgames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Fixture.h"

@implementation Fixture

+(void)insertGames{  
  Game *game = [Game createEntity];
  [game setTitle:@"Super Mario Galaxy"];
  [game setDetail:@"As always with any Nintendo game console, the first Super Mario game is one of the defining experiences on the system. Join Mario as he ushers in a new era of video games, defying gravity across all the planets in the galaxy. When some creature escapes into space with Princess Peach, Mario gives chase, exploring bizarre planets all across the galaxy. Since he's in space, Mario can perform mind-bending jumps unlike anything he’s done before. He'll also have a wealth of new moves that are all based around tilting, pointing and shaking the Wii Remote."];
  [game setPublisher:@"Nintendo"];
  [game setDeveloper:@"Nintendo EAD Tokyo"];
  [game setEsrb:@"E for Everyone"];
  [game setGenre:@"Platformer"];
  [game setAvatar_url:@"http://wiimedia.ign.com/wii/image/object/748/748588/MarioGalaxyFinalBoxboxart_160w.jpg"];
  [game setPlayers:[NSNumber numberWithInt:1]];
  [game setPlatform:@"Nintendo Wii"];

  game = [Game createEntity];
  [game setTitle:@"Ninja Gaiden II"];
  [game setDetail:@"The sequel to the blockbuster action game by Tecmo's heralded Team Ninja. Gamers must guide Ryu Hayabusa on a mission to avenge his clan and prevent the destruction of the human race. Armed with an assortment of ninja weaponry, players must help Ryu skillfully maneuver through a world fraught with peril and danger. Running on an entirely new gameplay engine, Ninja Gaiden 2 evolves the action in the sequel with an auto-generation health system, new enemies and locales, and thrilling combat built upon an extensive assortment of ninja weaponry."];
  [game setPublisher:@"Tecmo/Microsoft"];
  [game setDeveloper:@"Team Ninja"];
  [game setEsrb:@"M for Mature"];
  [game setGenre:@"Third Person Action"];
  [game setAvatar_url:@"http://pcmedia.ign.com/pc/image/object/686/686645/ninjagaiden2_rp_jpg_jpgcopyboxart_160w.jpg"];
  [game setPlayers:[NSNumber numberWithInt:1]];
  [game setPlatform:@"XBOX 360,PS3"];
  
  game = [Game createEntity];
  [game setTitle:@"Advance Wars:Dual Strike"];
  [game setDetail:@"The popular Advance Wars series is coming to the Nintendo DS. The latest game in the vaunted military tactics series features a new battle system that takes full advantage of the system's two screens. Use the top screen for quick-reference battle intel, or take control in battles that rage across both screens. Command a fleet of fighters high in the skies while troops clash with the enemy on the ground far below. Choose from new Commanding Officers, and combine their powers for incredible attacks that can turn the tide of battles. For a battle with a twist, players lead soldiers into a fast-paced, action-oriented battle against a storm of enemies. The game's acclaimed map editor also returns. Just grab a stylus and draw maps right on the touch screen, then send the maps to friends wirelessly."];
  [game setPublisher:@"Nintendo"];
  [game setDeveloper:@"Intelligent Systems"];
  [game setEsrb:@"E for Everyone"];
  [game setGenre:@"Turn Based Strategy"];
  [game setAvatar_url:@"http://dsmedia.ign.com/ds/image/object/707/707311/ntr_advancewars_pkg_01boxart_160w.jpg"];
  [game setPlayers:[NSNumber numberWithInt:2]];
  [game setPlatform:@"Nintendo DS"];
  
  game = [Game createEntity];
  [game setTitle:@"Patapon"];
  [game setDetail:@"Developed by Sony Computer Entertainment Japan, Patapon is a rhythm-based 2D platform/action game exclusively for the PSP. In the game, players are tasked with leading the colorful Patapons, a brave and noble tribe, through a series of epic battles against opposing armies and gigantic monsters. In a distinct gameplay twist, action and rhythm are intertwined as players utilize drumbeats to march, attack, and defend, ultimately leading the Patapon tribe to victory. Featuring more than 20 missions in a variety of environments such as swamps, volcanos, gorges and deserts, players will outfit a Patapon army, collect resources, and grow their tribe into a devastating fighting force."];
  [game setPublisher:@"Sony Computer Entertainment"];
  [game setDeveloper:@"Pyramid (JP)/Interlink"];
  [game setEsrb:@"E for Everyone"];
  [game setGenre:@"Action"];
  [game setAvatar_url:@"http://media.ign.com/games/image/object/949/949610/Patapon_PSP_USboxart_160w.jpg"];
  [game setPlayers:[NSNumber numberWithInt:1]];
  [game setPlatform:@"PSP"];
  
  game = [Game createEntity];
  [game setTitle:@"Shadow of the Colossus"];
  [game setDetail:@"Developed by Sony Computer Entertainment's team behind the critically acclaimed ICO. Players take the role of a young man seeking the truth of an ancient tale of power hidden in a mystical land. Shadow of the Colossus is a majestic journey through ancient lands to seek out and destroy gigantic mythical beasts. With a trusty horse at your side, players explore the spacious lands and unearth each towering Colossus creature. The uneasy task of defeating a Colossus relies on intelligent puzzle solving and action oriented gameplay. Armed with strong wits, a mystical sword and a sturdy bow, players use cunning and strategy to topple each behemoth."];
  [game setPublisher:@"Sony Computer Entertainment"];
  [game setDeveloper:@"SCE Studios Japan"];
  [game setEsrb:@"T for Teen"];
  [game setGenre:@"Third-Person Adventure"];
  [game setAvatar_url:@"http://media.gamestats.com/gg/image/object/490/490849/shadowofthecolossus_PS2Box-Ratedboxart_160w.jpg"];
  [game setPlayers:[NSNumber numberWithInt:1]];
  [game setPlatform:@"PS2"];
  
  game = [Game createEntity];
  [game setTitle:@"GoldenEye 007"];
  [game setDetail:@"You are Bond, James Bond. Your mission is to recover the key to a devastating Soviet orbital weapon, GoldenEye. Fight your way through 18 action-packed missions, using a host of Bond-esque weaponry and gadgets. Along the way you'll have to escape from a bunker that's about to be vaporized by the GoldenEye satellite as well as crash through the streets in a tank. GoldenEye 007 also supports four-player multiplayer with a host of options and game modes."];
  [game setPublisher:@"Nintendo"];
  [game setDeveloper:@"Rare"];
  [game setEsrb:@"T for Teen"];
  [game setGenre:@"First-Person Shooter"];
  [game setAvatar_url:@"http://media.gamestats.com/gg/image/goldeneye007_n64boxboxart_160w.jpg"];
  [game setPlayers:[NSNumber numberWithInt:4]];
  [game setPlatform:@"Nintendo 64"];
}

+(NSInteger)gamesCount{
  return [[Game numberOfEntities] integerValue];
}

+(void)setupCoreData{
  [Fixture insertGames];
}

+(void)truncateAll{
  [Game truncateAll];
}

@end
