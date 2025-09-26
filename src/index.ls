utils = {}
utils.preproc = ({canvas, light}) ->
  ctx = canvas.getContext '2d'
  imageData = ctx.getImageData(0, 0, canvas.width, canvas.height)
  pixels = imageData.data
  histogram = []
  for i in [0 to pixels.length - 4] by 4
    brightness = 0.299 * pixels[i] + 0.587 * pixels[i + 1] + 0.114 * pixels[i + 2]
    if pixels[i + 3] => histogram.push brightness
  histogram.sort (a,b) -> if a < b => -1 else if a > b => 1 else 0
  light = histogram[Math.floor(light * histogram.length) <? (histogram.length - 1)]
  for i in [0 to pixels.length - 4] by 4
    brightness = 0.299 * pixels[i] + 0.587 * pixels[i + 1] + 0.114 * pixels[i + 2]
    if brightness <= light
      pixels[i] = 0
      pixels[i+1] = 0
      pixels[i+2] = 0
    else
      pixels[i] = 255
      pixels[i+1] = 255
      pixels[i+2] = 255
  ctx.putImageData imageData, 0, 0

sample-icon ="""data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48c3ZnIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDBweCIgaGVpZ2h0PSIyMDBweCIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHN0eWxlPSJ3aWR0aDoxMDAlO2hlaWdodDoxMDAlO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0LXk6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdC14OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbi15OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbi14OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNvbG9yOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7YmFja2dyb3VuZC1hdHRhY2htZW50OmluaXRpYWw7YW5pbWF0aW9uLXBsYXktc3RhdGU6cGF1c2VkIiA+PGcgY2xhc3M9ImxkbC1zY2FsZSIgc3R5bGU9InRyYW5zZm9ybS1vcmlnaW46NTAlIDUwJTt0cmFuc2Zvcm06cm90YXRlKDBkZWcpIHNjYWxlKDEsIDEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjxjaXJjbGUgZmlsbD0iIzg0OWI4NyIgcj0iMTAuODc2IiBjeT0iMTUuODc2IiBjeD0iNTAiIHN0eWxlPSJmaWxsOnJnYigyOSwgMTQsIDExKTthbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID48L2NpcmNsZT4KPGcgc3R5bGU9ImFuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjxwYXRoIGZpbGw9IiM4NDliODciIGQ9Ik02OC43NjQgNTguNjM1YTMuOTg1IDMuOTg1IDAgMCAxLTMuOTg1LTMuOTg1di02LjY0MmMwLTguMTQ5LTYuNjMtMTQuNzc5LTE0Ljc3OS0xNC43NzlzLTE0Ljc3OSA2LjYzLTE0Ljc3OSAxNC43Nzl2Ni42NDJhMy45ODUgMy45ODUgMCAxIDEtNy45NyAwdi02LjY0MmMwLTEyLjU0NCAxMC4yMDUtMjIuNzQ5IDIyLjc0OS0yMi43NDlzMjIuNzQ5IDEwLjIwNSAyMi43NDkgMjIuNzQ5djYuNjQyYzAgMi4yLTEuNzg0IDMuOTg1LTMuOTg1IDMuOTg1eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD48L2c+CjxwYXRoIGQ9Ik0zOC40MTcgMzIuMTY3aDIzLjE2N3YzMy42NjdIMzguNDE3eiIgZmlsbD0iIzg0OWI4NyIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPHBhdGggZmlsbD0iIzg0OWI4NyIgZD0iTTQzLjM5OSA1My40ODdhNC45NCA0Ljk0IDAgMCAwLTQuOTQgNC45NFY5MC4wNmE0Ljk0IDQuOTQgMCAwIDAgOS44OCAwVjU4LjQyN2E0Ljk0IDQuOTQgMCAwIDAtNC45NC00Ljk0eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPHBhdGggZmlsbD0iIzg0OWI4NyIgZD0iTTU2LjYwMSA1My40ODdhNC45NCA0Ljk0IDAgMCAxIDQuOTQgNC45NFY5MC4wNmE0Ljk0IDQuOTQgMCAwIDEtOS44OCAwVjU4LjQyN2E0Ljk0IDQuOTQgMCAwIDEgNC45NC00Ljk0eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPG1ldGFkYXRhIHhtbG5zOmQ9Imh0dHBzOi8vbG9hZGluZy5pby9zdG9jay8iIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID48ZDpuYW1lIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID5tYW48L2Q6bmFtZT4KCgo8ZDp0YWdzIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID5tYW4scGVvcGxlLGNoYXJhY3RlcixwZXJzb24sZmlndXJlLGlkb2wsZG9sbDwvZDp0YWdzPgoKCjxkOmxpY2Vuc2Ugc3R5bGU9ImFuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPmJ5PC9kOmxpY2Vuc2U+CgoKPGQ6c2x1ZyBzdHlsZT0iYW5pbWF0aW9uLXBsYXktc3RhdGU6cGF1c2VkIiA+bXE1dXg8L2Q6c2x1Zz48L21ldGFkYXRhPjwvZz48IS0tIGdlbmVyYXRlZCBieSBodHRwczovL2xvYWRpbmcuaW8vIC0tPjwvc3ZnPg=="""
module.exports =
  pkg:
    name: 'pictogram', version: '0.0.1'
    extend: {name: "@makechart/base"}
    dependencies: [
      {name: "ldfile", version: \main, path: "index.min.js"}
      {name: "potrace-wasm", version: \main, path: "index.js", global: true}
    ]
    i18n: {}
  init: ({root, ctx, t, pubsub}) ->
    pubsub.fire \init, mod: mod({ctx, t})

mod = ({ctx, t}) ->
  {chart,d3,debounce,ldfile,loadFromCanvas} = ctx
  utils.trace-svg = (opt) -> new Promise (res, rej) ->
    size = opt.size or 256
    light = opt.light or 0.5
    file = opt.file
    img = new Image!
    img.onload = ->
      canvas = document.createElement 'canvas'
      ctx = canvas.getContext \2d
      scale = Math.min(size / img.width, size / img.height)
      canvas.width = size
      canvas.height = size
      [iw, ih] = [img.width * scale, img.height * scale]
      ctx.drawImage img, (size - iw)/2, (size - ih)/2, iw, ih
      utils.preproc {canvas, light}
      loadFromCanvas canvas, {}
        .then (svg) -> res svg
        .catch (e) -> rej e
    if typeof(file) == \string => img.src = file
    else
      fr = new FileReader!
      fr.onload = -> img.src = fr.result
      fr.readAsDataURL file

  sample: ->
    raw: [1 to 100].map (val) ~>
      name: "N-#val"
      cat: "Type #{Math.ceil(Math.random! * 4)}"
      value: Math.ceil(Math.random! * 3)
    binding:
      cat: key: \cat
      name: key: \name
  config: chart.utils.config.from({
    preset: \default
    legend: \legend
    tip: \tip
  }) <<<
    shape:
      glyph: type: \upload
      threshold: type: \number, default: 0.5, min: 0, max: 1, step: 0.01
    padding: type: \number, default: 0, min: -1, max: 1, step: 0.01
  dimension:
    value: type: \R
    cat: type: \C
    name: type: \N
  init: ->
    @tint = tint = new chart.utils.tint!
    @g = Object.fromEntries <[view legend]>.map ~> [it, d3.select(@layout.get-group it)]
    @g.defs = d3.select(@svg).append \g .attr \class, \defs
    @defs = @g.defs.append \defs
    @tip = new chart.utils.tip {
      root: @root
      accessor: ({evt}) ~>
        if !(evt.target and d = d3.select(evt.target).datum!) => return null
        return {name: (if d.cat => "#{d.cat} / " else '') + (d.name or ''), value: ''}
      range: ~> @layout.get-node \view .getBoundingClientRect!
    }
    @legend = new chart.utils.legend do
      layout: @layout
      name: \legend
      root: @root
      shape: (d) -> d3.select(@).attr \fill, tint.get d.key
    @legend.on \select, ~> @parse!; @bind!; @resize!; @render!
  destroy: -> if @tip => @tip.destroy!
  parse: ->
    hash = {}
    if @binding.cat =>
      @data.map (d) -> hash[d.cat] = true
      @cats = [k for k,v of hash]
      if @binding.value? =>
        list = @data
          .map (d) -> for i from 0 til d.value => d{cat, name}
          .reduce(((a,b) -> a ++ b),[])
      else
        list = @data
    else
      hash[''] = true
      @cats = []
      if @binding.value? =>
        list = @data
          .map (d) -> for i from 0 til d.value => {cat: '', name: d.name}
          .reduce(((a,b) -> a ++ b),[])
      else
        list = @data.map (d) -> {cat: '', name: d.name}

    list.map (d,i) -> d._idx = i
    @cats.sort!
    @legend.data @cats.map(-> {key: it, text: it})

    @parsed = list.filter ~>
      !@cats.length or !@cfg.legend.enabled or @legend.is-selected(it.cat)
    @parsed.map -> it._removing = false
    @parsed.sort (a,b) ->
      if hash[a.cat] < hash[b.cat] => return 1 else if hash[a.cat] > hash[b.cat] => return -1
      return if a.cat < b.cat => -1 else if a.cat > b.cat => 1 else 0
    @parsed.map (d,i) -> d._order = i
    @sum = @parsed.length

  resize: ->
    @tip.toggle(if @cfg.{}tip.enabled? => @cfg.tip.enabled else true)
    @legend.config @cfg.legend
    @root.querySelector('.pdl-layout').classList.toggle \legend-bottom, (@cfg.legend.position == \bottom)
    @legend.update!
    @layout.update false
    @tint.set(@cfg.palette.colors.map -> it.value or it)

  render: ->
    {tint,cfg} = @
    q = Math.round(Math.sqrt(@sum))
    [r,c] = [q or 1, Math.ceil(@sum / q) or 1]
    box = @layout.get-box \view
    [cw ,ch] = [box.width / c, box.height / r]
    @g.view.selectAll \g.data .data @parsed, (-> it._idx)
      ..exit!
        .each (d,i) ->
          d._removing = true
          d3.select(@).select \use.data
            .transition!duration 150
            .attr \x, cw/2
            .attr \y, cw/2
            .attr \opacity, 0
            .attr \transform, "scale(0,0)"
      ..exit!
        .transition!delay 150
          .remove!
      ..enter!append \g
        .attr \class, \data
        .attr \transform, (d,i) ->
          idx = d._order
          [x, y] = [cw * (idx % c), ch * (Math.floor(idx / c))]
          "translate(#x, #y)"
        .append \use
          .attr \class, \data
          .attr \opacity, 0
          .attr \x, cw/2
          .attr \y, ch/2
          .attr \transform, "scale(0,0)"

    @g.view.selectAll \g.data
      .transition!duration 350
      .attr \transform, (d,i) ->
        pad = cfg.padding or 0
        idx = d._order
        [x, y] = [cw * (idx % c), ch * (Math.floor(idx / c))]
        [x, y] = [x + (cw * pad / 2), y + (ch * pad / 2)]
        "translate(#x, #y)"
    @g.view.selectAll \g.data
      .each (d,i) ->
        if d._removing => return
        pad = cfg.padding or 0
        scale = Math.min((cw * (1 - pad)) / 256, (ch * (1 - pad)) / 256)
        d3.select(@).select \use.data
          .transition!duration 350
          .attr \fill, (d,i) -> tint.get d.cat
          .attr \opacity, 1
          .attr \x, 0
          .attr \y, 0
          .attr \transform, "scale(#scale,#scale)"
          .attr \href, '#glyph'

    q = if @p => @p else Promise.resolve!
    @p = q
      .then ~>
        file = ((@cfg.shape.glyph or []).0 or {})
        url = file.dataurl or sample-icon
        utils.trace-svg {file: url, light: @cfg.shape.threshold}
      .then (svg) ~>
        div = document.createElement(\div)
        div.innerHTML = svg
        g = div.querySelector('g').cloneNode(true)
        g.setAttribute \id, \glyph
        g.removeAttribute \fill
        @svg.querySelector('g.defs defs').innerHTML = ""
        @svg.querySelector('g.defs defs').appendChild g
    @legend.render!
