# pictogram 的 test case ( @makechart/viewer 的 mctest )
cats = <[Type-A Type-B Type-C Type-D]>
# 每份資料用自己的種子, 跟產生的先後順序無關
mk = (n, seed = n) ->
  rnd = mctest.random seed
  raw: [1 to n].map (i) -> {name: "N-#i", cat: cats[Math.floor(rnd! * 4)], value: Math.ceil(rnd! * 3)}
  binding: {cat: {key: \cat}, name: {key: \name}}
with-value = (d) -> d.binding.value = {key: \value}; d
plain = (d) -> d.binding = {name: {key: \name}}; d
# legend.select 不發事件, 照 pictogram 的 legend select handler 重畫
pick = (keys) -> (c) ->
  c.legend.select keys
  c.parse!; c.bind!; c.resize!; c.render!

mctest.suite do
  size: [480, 360]
  # 圖示是非同步描出來的 ( potrace-wasm ), 多等一點
  quiet: 600
  data:
    cat: mk 30
    value: with-value mk 20
    plain: plain mk 12
  cases:
    * name: "cat", data: \cat
    * name: "value", data: \value
    * name: "plain", data: \plain
    * name: "padding", data: \cat, config: {padding: 0.3}
    * name: "threshold", data: \cat, config: {shape: {threshold: 0.2}}
    * name: "legend:bottom", data: \cat, config: {legend: {position: \bottom}}
    * name: "legend:pick", data: \cat, steps: pick <[Type-A Type-C]>
    * name: "update", data: \cat, steps: (c) -> d = mk 18, 7; c.set-raw d.raw, d.binding

# lite 版才有: 圖示放大與移除縮小的中間格
mctest.suite do
  size: [480, 360]
  quiet: 600
  data: cat: mk 30
  cases:
    * name: "anim:pick-frames", data: \cat
      steps: (c, ctx) ->
        pick(<[Type-A Type-C]>) c
        for i from 1 to 3
          c.anim.step 100
          ctx.capture "t#{i * 100}"
