#import "../typst-draw-layout/lib/lib.typ": *

#set page(paper: "a4", height: 40em, width: 55em, margin: 1em)

#set text(size: 6.5pt, font: ("Lora", "Source Han Serif SC", "CaskaydiaCove NF"))

#let pat = pattern(
  size: (1pt, 1pt),
  relative: "parent",
  place(dx: 0.3pt, dy: 0.3pt, rotate(45deg, square(size: 0.3pt, fill: red))),
)

#let footer = draw-layout(
  width: 50,
  main-body-precent: 40,
  left-note-precent: 10,
  right-note-precent: 30,
  table-stroke: 0.7pt + black,
  row-size-basic: 0.3cm,
  unit(48, completion: true, fill: yellow.lighten(80%))[metaindex_handle],
  unit(40, completion: true, fill: green.lighten(80%))[index_handle],
  unit(
    15,
    completion: true,
    fill: red.lighten(80%),
  )[padding][#rect(fill: pat, width: 100%)[#align(center)[complete to 40 bytes]]],
  unit(41, completion: true, fill: blue.lighten(80%))[magic_number],
  note(side: "right", 1, end-row: 3, bracket: "curly")[40 bytes],
  note(side: "left", 1)[Varint64\*2],
  note(side: "left", 2)[Varint64\*2],
  note(side: "left", 4, bracket: "curly")[8 bytes],
)

#let entries-and-info-block = draw-layout(
  width: 100,
  main-body-precent: 100,
  left-note-precent: 17,
  right-note-precent: 0,
  table-stroke: 0.7pt + black,
  row-size-basic: 0.3cm,
  header(
    side: "top",
    header-unit(1, end-pos: 18, [#align(center + horizon)[varint32]]),
    header-unit(19, end-pos: 36, [#align(center + horizon)[varint32]]),
    header-unit(37, end-pos: 54, [#align(center + horizon)[varint32]]),
    header-unit(55, end-pos: 77, [#align(center + horizon)[char[ ]]]),
    header-unit(78, end-pos: 100, [#align(center + horizon)[char[ ]]]),
  ),
  // entries 1
  unit(18, fill: yellow.lighten(80%))[s_b_1],
  unit(18, fill: yellow.lighten(75%))[us_b_1],
  unit(18, fill: yellow.lighten(70%))[v_l_1],
  unit(23, fill: yellow.lighten(65%))[key_d_1],
  unit(23, fill: yellow.lighten(60%))[value_1],
  // entries 2
  unit(18, fill: green.lighten(80%))[s_b_2],
  unit(18, fill: green.lighten(75%))[us_b_2],
  unit(18, fill: green.lighten(70%))[v_l_2],
  unit(23, fill: green.lighten(65%))[key_d_2],
  unit(23, fill: green.lighten(60%))[value_2],
  // entries ...
  unit(100, fill: aqua.lighten(40%))[......],
  // entries n
  unit(18, fill: red.lighten(80%))[s_b_n-1],
  unit(18, fill: red.lighten(75%))[us_b_n-1],
  unit(18, fill: red.lighten(70%))[v_l_n-1],
  unit(23, fill: red.lighten(65%))[key_d_n-1],
  unit(23, fill: red.lighten(60%))[value_n-1],
  // restart array
  unit(25, fill: purple.lighten(80%))[restart[0]],
  unit(25, fill: purple.lighten(75%))[restart[1]],
  unit(25, fill: purple.lighten(70%))[......],
  unit(25, fill: purple.lighten(65%))[restart[n-1]],
  // restart num
  unit(
    25,
    fill: orange.lighten(70%),
    completion: true,
  )[restart_num][#align(left)[ #sym.space #sym.arrow.r uint32_t #sym.space #sym.arrow.curve uint32_t ]],
  note(1, side: "left", end-row: 2)[restart[1]#sym.arrow.r],
  note(3, side: "left", end-row: 4)[restart[n-1]#sym.arrow.r],
)

#let block-of-data-and-meta-block = draw-layout(
  width: 100,
  main-body-precent: 100,
  left-note-precent: 0,
  right-note-precent: 0,
  table-stroke: 0.7pt + black,
  row-size-basic: 0.3cm,
  header(
    side: "top",
    header-unit(1, end-pos: 50)[#align(center + horizon)[unsigned char[ ]]],
    header-unit(51, end-pos: 70)[#align(center + horizon)[1 byte]],
    header-unit(71, end-pos: 100)[#align(center + horizon)[4 bytes]],
  ),
  unit(50, fill: yellow.lighten(80%))[Entries and Info],
  unit(20, fill: green.lighten(80%))[Type],
  unit(30, fill: red.lighten(80%))[CRC32],
)

#let sstable-block = draw-layout(
  width: 30,
  main-body-precent: 15,
  left-note-precent: 0,
  right-note-precent: 60,
  table-stroke: 0.7pt + black,
  table-inset: 0cm,
  row-size-basic: 0.6cm,
  // info
  unit(30, fill: yellow.lighten(80%), completion: true)[DataBlock_1],
  unit(30, fill: yellow.lighten(80%), completion: true)[DataBlock_2],
  unit(30, fill: yellow.lighten(80%), completion: true)[......],
  unit(30, fill: yellow.lighten(80%), completion: true)[DataBlock_n-1],
  unit(30, fill: green.lighten(80%), completion: true)[MetaBlock_1],
  unit(30, fill: green.lighten(80%), completion: true)[MetaBlock_2],
  unit(30, fill: green.lighten(80%), completion: true)[......],
  unit(30, fill: green.lighten(80%), completion: true)[MetaBlock_n-1],
  unit(30, fill: red.lighten(80%), completion: true)[MetaIndexBlock],
  unit(30, fill: blue.lighten(80%), completion: true)[IndexBlock],
  unit(30, fill: purple.lighten(80%), completion: true)[Footer],
  note(side: "right", bracket: "curly", 1, end-row: 8, postion: left)[
    #block(width: 96%)[
      #set text(size: 0.8em)
      #grid(rows: (auto, auto), gutter: 1em, block(width: 100%)[
        #set align(center)
        #set text(size: 1.5em, style: "oblique")
        Block of Data and Meta
      ], block-of-data-and-meta-block)

      #v(2em)

      #grid(rows: (auto, auto, auto), gutter: 1em, block(width: 100%)[
        #set align(center)
        #set text(fill: black, size: 1.5em, style: "oblique")
        Entries and Info
      ], entries-and-info-block, block(width: 100%, inset: (left: 1em))[
        #set align(right)
        #set text(fill: black, size: 1em, style: "oblique")
        s_b = shared_bytes \
        us_b = unsahred_bytes \
        v_l = value_length \
        key_d = key_delta \
      ])
    ]
  ],
  note(side: "right", bracket: "curly", 11)[
    #block(width: 96%)[
      #set text(size: 0.8em)
      #footer
    ]
  ],
  note(side: "right", 9)[#sym.arrow.l Vector\<Key, BlockHandle>],
  note(side: "right", 10)[#sym.arrow.l Vector\<Key, BlockHandle>],
)

#grid(rows: (auto, auto), gutter: 3em, block(width: 100%)[
  #set align(center)
  #set text(size: 2em, style: "oblique")
  SSTable
], sstable-block)

