

zone1 = compileFinal str 
[
  ["zm1_1", "opbase"],
  ["zm1_2", "opbase"],
  ["zm1_3", "opbase"],
  ["zm1_4", 2],
  ["zm1_5", 16],
  ["zm1_6", 16],
  ["zm1_7", 16],
  ["zm1_8", 5],
  ["zm1_9", 4],
  ["zm1_10", 4]
];

zone2 = compileFinal str
[  
  ["zm2_1", 20],
  ["zm2_2", 20],
  ["zm2_3", 17],
  ["zm2_4", 17],
  ["zm2_5", 1],
  ["zm2_6", "opbase"]
];

zone3 = compileFinal str
[
  ["zm3_1", 17],
  ["zm3_2", 17],
  ["zm3_3", 17],
  ["zm3_4", 16],
  ["zm3_5", 16],
  ["zm3_6", 9],
  ["zm3_7", 8],
  ["zm3_8", 8]
];

zone4 = compileFinal str
[
  ["zm4_1", 1],
  ["zm4_2", 1],
  ["zm4_3", 5],
  ["zm4_4", "any"],
  ["zm4_5", "any"]
];

zone5 = compileFinal str
[
  ["zm5_1", 1],
  ["zm5_2", 16],
  ["zm5_3", 7],
  ["zm5_4", 7],
  ["zm5_5", 6],
  ["zm5_6", "any"],
  ["zm5_7", 4]
];

zone6 = compileFinal str
[
  ["zm6_1", 5],
  ["zm6_2", 13],
  ["zm6_3", 12],
  ["zm6_4", 12],
  ["zm6_5", "any"],
  ["zm6_6", "any"]
];

zone7 = compileFinal str
[
  ["zm7_1", 5],
  ["zm7_2", 5],
  ["zm7_3", 16],
  ["zm7_4", 9],
  ["zm7_5", 11],
  ["zm7_6", 13],
  ["zm7_7", 13]
];  

zone8 = compileFinal str
[
  ["zm8_1", 3],
  ["zm8_2", 3],
  ["zm8_3", 9],
  ["zm8_4", 9],
  ["zm8_5", 9]
];

zone9 = compileFinal str
[
  ["zm9_1", 8],
  ["zm9_2", 8],
  ["zm9_3", 8],
  ["zm9_4", 3],
  ["zm9_5", 16],
  ["zm9_6", 7],
  ["zm9_7", 11],
  ["zm9_8", 11],
  ["zm9_9", 10]
];

zone10 = compileFinal str
[
  ["zm10_1", 9],
  ["zm10_2", 11],
  ["zm10_3", 11],
  ["zm10_4", 11],
  ["zm10_5", "blubase"]
];

zone11 = compileFinal str
[
  ["zm11_1", 10],
  ["zm11_2", 10],
  ["zm11_3", 10],
  ["zm11_4", 9],
  ["zm11_5", 9],
  ["zm11_6", 7],
  ["zm11_7", 13],
  ["zm11_8", 19],
  ["zm11_9", "blubase"]
];

zone12 = compileFinal str
[
  ["zm12_1", 6],
  ["zm12_2", 6],
  ["zm12_3", 13],
  ["zm12_4", 19],
  ["zm12_5", 19],
  ["zm12_6", 18],
  ["zm12_7", "any"],
  ["zm12_8", "any"]
];

zone13 = compileFinal str
[
  ["zm13_1", 7],
  ["zm13_2", 7],
  ["zm13_3", 11],
  ["zm13_4", 19],
  ["zm13_5", 19],
  ["zm13_6", 12],
  ["zm13_7", 6]
];

zone14 = compileFinal str
[
  ["zm14_1", 19],
  ["zm14_2", 15],
  ["zm14_3", 15],
  ["zm14_4", "any"],
  ["zm14_5", "any"],
  ["zm14_6", 18]
];

zone15 = compileFinal str
[
  ["zm15_1", "blubase"],
  ["zm15_2", "blubase"],
  ["zm15_3", "any"],
  ["zm15_4", 14],
  ["zm15_5", 14],
  ["zm15_6", 19]
];

zone16 = compileFinal str
[
  ["zm16_1", 1],
  ["zm16_2", 1],
  ["zm16_3", 1],
  ["zm16_4", 17],
  ["zm16_5", 3],
  ["zm16_6", 3],
  ["zm16_7", 9],
  ["zm16_8", 7],
  ["zm16_9", 5]
];

zone17 = compileFinal str
[
  ["zm17_1", 2],
  ["zm17_2", 2],
  ["zm17_3", 16],
  ["zm17_4", 3],
  ["zm17_5", 3],
  ["zm17_6", 3]
];

zone18 = compileFinal str
[
  ["zm18_1", 12],
  ["zm18_2", 19],
  ["zm18_3", 14],
  ["zm18_4", "any"],
  ["zm18_5", "any"],
  ["zm18_6", "any"]
];

zone19 = compileFinal str
[
  ["zm19_1", 13],
  ["zm19_2", 13],
  ["zm19_3", 11],
  ["zm19_4", 15],
  ["zm19_5", 14],
  ["zm19_6", 18],
  ["zm19_7", 12],
  ["zm19_8", 12]
];

zone20 = compileFinal str
[
  ["zm20_1", 2],
  ["zm20_1", 2]
];

OPBASE = compileFinal str
[
  ["zm_opb_1", 2],
  ["zm_opb_2", 1],
  ["zm_opb_3", 1],
  ["zm_opb_4", 1]
];

BLUBASE = compileFinal str
[
  ["zm_blb_1", 10],
  ["zm_blb_2", 11],
  ["zm_blb_3", 15],
  ["zm_blb_4", 15],
  ["zm_blb_5", "any"],
  ["zm_blb_6", "any"]
];

allZoneMarkers = compileFinal str 
[
  "zone1",
  "zone2",
  "zone3",
  "zone4",
  "zone5",
  "zone6",
  "zone7",
  "zone8",
  "zone9",
  "zone10",
  "zone11",
  "zone12",
  "zone13",
  "zone14",
  "zone15",
  "zone16",
  "zone17",
  "zone18",
  "zone19",
  "zone20"
];  