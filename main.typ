#import "typst-draw-layout/lib/lib.typ": *
#set text(font: ("Lora", "Source Han Serif SC", "CaskaydiaCove NF"))

#draw-layout(
  width: 30,
  left-width: 6,
  right-width: 6,
  table-stroke: 0.7pt + black,
  table-inset: 0cm,
  stroke: 1pt + red,
  row-size-basic: 0.7cm,
  rows-size: (
    "9": 2cm,
  ),

  title(side: "top")[#text(
      fill: black,
      size: 1.5em,
      style: "oblique",
    )[LevelDB SSTable]],

  // header(
  //   side: "top",
  //   header-unit(1, [h]),
  //   header-unit(2, [#align(bottom)[T]]),
  //   header-unit(3, [3]),
  //   header-unit(8, end-pos: 20, [hello]),
  // ),

  unit(40, fill: yellow.lighten(70%), completion: true)[40],
  unit(55, fill: purple.lighten(70%), completion: true)[55],
  unit(20, fill: blue.lighten(70%), completion: true)[20],
  unit(30, fill: green.lighten(70%), completion: true )[30],
  unit(50, fill: red.lighten(70%))[50],

  unit(40, fill: yellow.lighten(70%), completion: true)[40],
  unit(20, completion: true)[20],
  unit(60)[60],
  unit(100, fill: green.lighten(70%), completion: true)[][#align(right)[world]][100],
  unit(28)[28],

  note(side: "left", 1, end-row: 4, bracket: "curly")[Note],
  note(side: "right", 3, end-row: 4, bracket: "curly")[Tests],
  note(side: "right", 6, end-row: 7)[#text(fill:red)[#sym.arrow.l] 结尾],
)

// #let test-dictionary = (
//   "1": 200em,
//   "2": 100em,
//   "3": 300em,
// )

// #text()[#("1" in test-dictionary)]