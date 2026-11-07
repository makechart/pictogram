# Change Logs

## v0.0.3

 - fix bug: tooltip was empty since glyphs didn't carry their data ( regression in 0.0.2 )
 - add hover test case


## v0.0.2

 - extend the lite base ( `@makechart/base` `lite/index.html`, no d3 ): needs `@makechart/base` >= 0.2.0
   and `@plotdb/chart` >= 3.7.0.
   transitions run on `chart.anim`, so animation can be recorded frame by frame ( `anim.manual` / `step` )
 - fix bug: `resize` threw when no palette is set
 - fix bug: removed glyphs shrank to 0 but were never removed from DOM
 - fix bug: removed glyphs shrank towards `cw/2` for y instead of `ch/2`
 - trace the glyph only when the glyph or threshold changes, instead of on every render
 - add test cases ( `test/index.ls`, run with `npm test` via `@makechart/viewer` )


## v0.0.1

init release
