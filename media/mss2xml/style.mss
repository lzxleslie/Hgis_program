//2016.5 by Wanglu
@font: "AR PL UKai CN Book","Arial Regular","DejaVu Sans Book";
@font_1: "AR PL UKai CN Book";
@line:rgb(35,24,21);//k=100
@line_1:#000;
@640201_fill:rgb(247,201,221);
@640201_fill_width:1.5;
@650201_line:0.2;
@640201_line_width:0.3;
@420901_color:rgb(243,153,58);
@420901_case_line:0.7;
@420901_fill_line:0.4;
@440100_fill_line:0.15;
@440200_fill_line:0.15;
@440100_fill_color:rgb(114,113,113);//k=70
@410101_case_width:0.4;
@210101_line-color:rgb(0,160,233);//c=100
@210101_fill-color:rgb(186,227,249);//c=30
@210101_line_width:0.4;
@221000_line_color:rgb(194,135,0);
@221000_line_width:0.15;
@resa_fill_color:rgb(245,176,144);
@270801_line_width:0.2;
@420101_line_color:rgb(230,0,18);
@420201_line_color:rgb(243,152,0);
@420301_line_color:rgb(232,82,152);
@vega_fill:rgb(211,240,190);
@310200_fill_color:rgb(212,217,220);
@deyang_contour:rgb(194,135,0);
//@shengdao_color:lighten(#DEB887,2);
//@shengdao_color:lighten(#8B5A2B,40);
//@shengdao_color:lighten(#CDAF95,1);
@shengdao_color:lighten(rgb(215,194,158),1);

Map {
  background-color: #fff;
  buffer-size:256;
}

#boul::case{
  [gb=640201]{
  line-color:@640201_fill;
  line-width:@640201_fill_width*3;}
  [gb=650201]{
  line-color:@line;
  line-width:@650201_line*3;
  line-dasharray:4.3,2.8,0.6,2.8;
    //2.3,0.8,0.2,0.8
  }
}
#boul::fill{
  [gb=640201]{
    line-color:@line;
    line-width:@640201_line_width*3;
    line-dasharray:4.3,2.5,4.3,2.75,0.9,2.75;
    //2.3,0.5,2.3,0.75,0.3,0.75
  }
}
#lrdl_1::case{
  [gb=420101]{
    line-width:@420901_fill_line*3;
    line-color:@420101_line_color;
    [zoom>=12]{
    [zoom=12],[zoom=13]{
    line-width:6;
    line-color:@line_1;}
    [zoom>13]{
    line-width:7;
    line-color:@line_1;
      }
    }
  }
  [gb=420201]{
    line-width:@420901_fill_line*3;
    line-color:@420201_line_color;
    [zoom>=12]{
    [zoom=12],[zoom=13]{
    line-width:5;
    line-color:@line_1;}
    [zoom>13]{
    line-width:6;
    line-color:@line_1;
      }
    }
  }
  [gb=420301],
  [gb=420401],
  [gb=420501],
  [gb=420801]{
    line-width:@270801_line_width*3;
    line-color:@420301_line_color;
    [zoom>=12]{
    [zoom=12],[zoom=13]{
    line-width:4;
    line-color:@line_1;}
    [zoom>13]{
    line-width:5;
    line-color:@line_1;
      }
    }
  }
  [gb=420302],
  [gb=420402],
  [gb=420502],
  [gb=420802] {
    line-width:@270801_line_width*3;
    line-color:@420301_line_color;
    line-dasharray:8,1;
  }
  
}
#lrdl_1::fill1{
  [zoom>=12]{
   [gb=420101]{
    line-color:@deyang_contour;
    [zoom=12],[zoom=13]{
    line-width:4.5;}
    [zoom>13]{
    line-width:5.5;}
  }
  [gb=420201]{
    line-color:@shengdao_color;
    [zoom=12],[zoom=13]{
    line-width:4.5;}
    [zoom>13]{
    line-width:5;}
    }
  [gb=420301],
  [gb=420401],
  [gb=420501],
  [gb=420801]{
    line-color:@shengdao_color;
    [zoom=12],[zoom=13]{
    line-width:3.5;}
    [zoom>13]{
    line-width:4;}
  }
 }  
}
#lrdl_1::fill2{
  [gb=420901]{
    line-width:@420901_fill_line*3;
    line-color:@420901_color;
  }
   [gb=420902]{
    line-width:@420901_fill_line*3;
    line-color:@420901_color;
    line-dasharray:10,1;
  }
  [gb=440100],
  [gb=420400],
  [gb=420500],
  [gb=420800],
  [gb=430501],
  [gb=430502]{
    line-width:1;
    line-color:@line_1;
    [zoom<=13]{line-width:0.5;}
  }
  [gb=440200]{
    line-width:1;
    line-color:@line_1;
    line-dasharray:6,3;//4,1
    [zoom<=13]{line-width:0.5;}
  }
  [zoom>=12]{
  [gb=420101]{
    shield-name: "[rn]";
    shield-face-name: @font;
    shield-fill: #000000;
    //shield-size: 15;
    shield-file: url("images/shield_1.png");
    //shield-transform:"scale(0.2)";
    shield-min-padding: 15;
    shield-min-distance: 200;
    shield-placement: line;
    //shield-transform:"scale(0.4)";
    shield-transform:"scale(0.3)";
    shield-size:10;
  
   
  }
  [gb=420201]{
    
	shield-name: "[rn]";
    shield-face-name: @font;
    shield-fill: #000000;
    shield-file: url("images/shield_1.png");
    //shield-transform:"scale(0.2)";
    shield-min-padding: 15;
    shield-min-distance: 200;
    shield-placement: line;
    shield-transform:"scale(0.3)";
    shield-size:10;
  
  }
  [gb=420301]{
    shield-name: "[rn]";
    shield-face-name: @font;
    shield-fill: #000000;
    shield-file: url("images/shield_1.png");
    //shield-transform:"scale(0.2)";
    shield-min-padding: 15;
    shield-min-distance: 200;
    shield-placement: line;
    shield-transform:"scale(0.3)";
    shield-size:10;
   
  }
  [gb=420401]{
    shield-name: "[rn]";
    shield-face-name: @font;
    shield-fill: #000000;
    shield-file: url("images/shield_1.png");
    //shield-transform:"scale(0.2)";
    shield-min-padding: 15;
    shield-min-distance: 200;
    shield-placement: line;
    shield-transform:"scale(0.3)";
    shield-size:10;
    
  }
  [gb=420501]{
   shield-name: "[rn]";
    shield-face-name: @font;
    shield-fill: #000000;
    shield-file: url("images/shield_1.png");
    //shield-transform:"scale(0.2)";
    shield-min-padding: 15;
    shield-min-distance: 200;
    shield-placement: line;
    shield-transform:"scale(0.3)";
    shield-size:10;
   
  }
  [gb=420801]{
    shield-name: "[rn]";
    shield-face-name: @font;
    shield-fill: #000000;
    shield-file: url("images/shield_1.png");
    //shield-transform:"scale(0.2)";
    shield-min-padding: 15;
    shield-min-distance: 200;
    shield-placement: line;
    shield-transform:"scale(0.3)";
    shield-size:10;
  }
  }
}
#lrrl::case{
  [gb=410103]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*3;
    line-dasharray:9,1;
  }
}
#lrrl::fill{
  [gb=410103]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*8;
    line-dasharray:1,10;
    }
}
#hyda{
  [gb=210101],
  [gb=210301],
  [gb=220200],
  [gb=230101],
  [gb=230102],
  [gb=240101],
  [gb=261200],
  [gb=810306]{
   	line-color:@210101_line-color;
    polygon-fill:@210101_fill-color;
  }
  [gb=210104]{
    line-color:@210101_line-color;
    line-dasharray:0.2,0.6;
    polygon-fill:@210101_fill-color;
  }
}
#hydl{
  [gb=210101],
  [gb=210102],
  [gb=210301],
  [gb=210400]{
    line-color:@210101_line-color;
    line-width:@210101_line_width*3;
  }
  [gb=210104]{
    line-color:@210101_line-color;
    line-width:@210101_line_width*3;
    line-dasharray:0.4,2.6;//0.4,0.6
  }
  [gb=210200]{
    line-color:@210101_line-color;
    line-width:@210101_line_width*3;
    line-dasharray:4,2.5;//2,0.5
  }
  [gb=221000]{
    line-color:@221000_line_color;
    line-width:@221000_line_width*3;
    line-dasharray:4.0,3.0;//2,1
  }
  
}
#resa{
  [gb=310200]{
  line-color:@440100_fill_color;
  polygon-fill:@310200_fill_color;}
  [gb=310700]{
  line-color:@440100_fill_color;
  polygon-fill:@310200_fill_color;
  }
  [gb=310500]{
  line-color:@440100_fill_color;
  polygon-fill:@310200_fill_color;
  }
}
#hfca{
  line-color:@210101_line-color;
  polygon-fill:@210101_fill-color;
  polygon-pattern-file:url(images/antan.PNG);
  polygon-pattern-comp-op:color-burn;
  polygon-pattern-alignment:global;
}
#hfcl::case{
  [zoom>=13]{
  [gb=220700]{
    line-color:@210101_line-color;
    line-width:@210101_line_width*3;
    line-dasharray:3,2.5;//1,0.5
  }
  [gb=220800],
  [gb=260400]{
    line-color:@210101_line-color;
    line-width:@210101_line_width*3;
  }
  [gb=270101]
  {
    line-color:@440100_fill_color;
    line-width:@410101_case_width*3;
   line-offset:5;
  }
  [gb=270102]  {
    line-color:@440100_fill_color;
    line-width:@410101_case_width*3;
   line-offset:3;
  }
  [gb=270500]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*3;
    line-dasharray:3,2.5;//1,0.5
  }
  [gb=270600]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*3;
  }
  [gb=270801],
  [gb=270802]{
    line-color:@440100_fill_color;
    line-width:@270801_line_width*3;
  }
 }
}
#hfcl::fill{
  [zoom>=13]{
  [gb=270101]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*8;
    line-dasharray:1,3.2;//0.3,1.2
    line-offset:5;
  }
  [gb=270102]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*6;
    line-dasharray:1,3.2;//0.3,1.2
    line-offset:5;
  }
  [gb=270500]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*3;
    line-offset:-2.4;//0.6
  }
  [gb=270600]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*3;
    line-offset:-2.4;//0.6
  }
  [gb=270801],
  [gb=270802]{
    line-color:@440100_fill_color;
    line-width:@270801_line_width*10;
    line-dasharray:1,3;//1
  }
 }
}
#hfcl::fill2{
  [zoom>=13]{
  [gb=270500]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*8;
    line-dasharray:1,3.8;//0.8
    line-offset:-3.5;
  }
  [gb=270600]{
    line-color:@440100_fill_color;
    line-width:@410101_case_width*8;
    line-dasharray:1,3.8;//0.8
    line-offset:-3.5;
  }
 }
}
#vega{
  [gb=810302]
    {polygon-fill:@vega_fill;}
}
#RESL{
line-color:@line;
line-width:1;
[zoom>13]{line-width:1.5;}
[zoom>15]{line-width:2;}
}
#deyang_contour{
[zoom>10]{
line-color:@deyang_contour;
[zoom<=11]{line-width:0.2;}
[zoom=12],[zoom=13]{line-width:0.3;}
[zoom=14]{line-width:0.4;}
[zoom>=15]{line-width:0.5;}
[elev=350],[elev=400],[elev=450],[elev=500],[elev=550],[elev=600],[elev=650],
[elev=700],[elev=750],[elev=800],[elev=850],[elev=900],[elev=950],[elev=1000],
[elev=1050],[elev=1100],[elev=1150],[elev=1200],[elev=1250],[elev=1300],[elev=1350],
[elev=1400],[elev=1450],[elev=1500],[elev=1550],[elev=1600],[elev=1650],[elev=1700],
[elev=1750],[elev=1800],[elev=1850],[elev=1900],[elev=1950],[elev=2000],[elev=2050],
[elev=2100],[elev=2150],[elev=2200],[elev=2250],[elev=2300],[elev=2350],[elev=2400],
[elev=2450],[elev=2500],[elev=2550],[elev=2600],[elev=2650],[elev=2700],[elev=2750],
[elev=2800],[elev=2850],[elev=2900],[elev=2950],[elev=3000],[elev=3050],[elev=3100],
[elev=3150],[elev=3200],[elev=3250],[elev=3300],[elev=3350],[elev=3400],[elev=3450],
[elev=3500],[elev=3550],[elev=3600],[elev=3650],[elev=3700],[elev=3750],[elev=3800],
[elev=3850],[elev=3900],[elev=3950],[elev=4000],[elev=4050],[elev=4100],[elev=4150],
[elev=4200],[elev=4250],[elev=4300],[elev=4350],[elev=4400],[elev=4450],[elev=4500],
[elev=4550],[elev=4600],[elev=4650],[elev=4700],[elev=4750],[elev=4800],[elev=4850],
[elev=4900],[elev=4950]{
    line-width:2;
    [zoom<=11]{line-width:0.4;}
    [zoom=12],[zoom=13]{line-width:0.6;}
    [zoom=14]{line-width:0.8;}
    [zoom>=15]{line-width:1;}
  }
}
}
