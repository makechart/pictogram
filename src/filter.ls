# Deprecated
# this script use filter + masking, which is much slower than by potracing.

sample-icon ="""data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48c3ZnIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDBweCIgaGVpZ2h0PSIyMDBweCIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHN0eWxlPSJ3aWR0aDoxMDAlO2hlaWdodDoxMDAlO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0LXk6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdC14OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbi15OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbi14OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNvbG9yOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7YmFja2dyb3VuZC1hdHRhY2htZW50OmluaXRpYWw7YW5pbWF0aW9uLXBsYXktc3RhdGU6cGF1c2VkIiA+PGcgY2xhc3M9ImxkbC1zY2FsZSIgc3R5bGU9InRyYW5zZm9ybS1vcmlnaW46NTAlIDUwJTt0cmFuc2Zvcm06cm90YXRlKDBkZWcpIHNjYWxlKDEsIDEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjxjaXJjbGUgZmlsbD0iIzg0OWI4NyIgcj0iMTAuODc2IiBjeT0iMTUuODc2IiBjeD0iNTAiIHN0eWxlPSJmaWxsOnJnYigyOSwgMTQsIDExKTthbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID48L2NpcmNsZT4KPGcgc3R5bGU9ImFuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjxwYXRoIGZpbGw9IiM4NDliODciIGQ9Ik02OC43NjQgNTguNjM1YTMuOTg1IDMuOTg1IDAgMCAxLTMuOTg1LTMuOTg1di02LjY0MmMwLTguMTQ5LTYuNjMtMTQuNzc5LTE0Ljc3OS0xNC43NzlzLTE0Ljc3OSA2LjYzLTE0Ljc3OSAxNC43Nzl2Ni42NDJhMy45ODUgMy45ODUgMCAxIDEtNy45NyAwdi02LjY0MmMwLTEyLjU0NCAxMC4yMDUtMjIuNzQ5IDIyLjc0OS0yMi43NDlzMjIuNzQ5IDEwLjIwNSAyMi43NDkgMjIuNzQ5djYuNjQyYzAgMi4yLTEuNzg0IDMuOTg1LTMuOTg1IDMuOTg1eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD48L2c+CjxwYXRoIGQ9Ik0zOC40MTcgMzIuMTY3aDIzLjE2N3YzMy42NjdIMzguNDE3eiIgZmlsbD0iIzg0OWI4NyIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPHBhdGggZmlsbD0iIzg0OWI4NyIgZD0iTTQzLjM5OSA1My40ODdhNC45NCA0Ljk0IDAgMCAwLTQuOTQgNC45NFY5MC4wNmE0Ljk0IDQuOTQgMCAwIDAgOS44OCAwVjU4LjQyN2E0Ljk0IDQuOTQgMCAwIDAtNC45NC00Ljk0eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPHBhdGggZmlsbD0iIzg0OWI4NyIgZD0iTTU2LjYwMSA1My40ODdhNC45NCA0Ljk0IDAgMCAxIDQuOTQgNC45NFY5MC4wNmE0Ljk0IDQuOTQgMCAwIDEtOS44OCAwVjU4LjQyN2E0Ljk0IDQuOTQgMCAwIDEgNC45NC00Ljk0eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPG1ldGFkYXRhIHhtbG5zOmQ9Imh0dHBzOi8vbG9hZGluZy5pby9zdG9jay8iIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID48ZDpuYW1lIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID5tYW48L2Q6bmFtZT4KCgo8ZDp0YWdzIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID5tYW4scGVvcGxlLGNoYXJhY3RlcixwZXJzb24sZmlndXJlLGlkb2wsZG9sbDwvZDp0YWdzPgoKCjxkOmxpY2Vuc2Ugc3R5bGU9ImFuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPmJ5PC9kOmxpY2Vuc2U+CgoKPGQ6c2x1ZyBzdHlsZT0iYW5pbWF0aW9uLXBsYXktc3RhdGU6cGF1c2VkIiA+bXE1dXg8L2Q6c2x1Zz48L21ldGFkYXRhPjwvZz48IS0tIGdlbmVyYXRlZCBieSBodHRwczovL2xvYWRpbmcuaW8vIC0tPjwvc3ZnPg=="""
module.exports =
  pkg:
    name: 'pictogram', version: '0.0.1'
    extend: {name: "base", version: "0.0.1"}
    dependencies: [
      {name: "ldfile", version: \main, path: "index.min.js"}
    ]
    i18n: {}
  init: ({root, ctx, t, pubsub}) ->
    pubsub.fire \init, mod: mod({ctx, t})

mod = ({ctx, t}) ->
  {chart,d3,debounce,ldfile} = ctx
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
  }) <<<
    shape: type: \upload
    padding: type: \number, default: 0, min: 0, max: 1, step: 0.01
  dimension:
    value: type: \R
    cat: type: \C
    name: type: \N
  init: ->
    @tint = tint = new chart.utils.tint!
    @g = Object.fromEntries <[view legend]>.map ~> [it, d3.select(@layout.get-group it)]
    @g.defs = d3.select(@svg).append \g .attr \class, \defs
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
    @legend.config @cfg.legend
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
          d3.select(@).select \rect.data
            .transition!duration 150
            .attr \x, cw/2
            .attr \y, cw/2
            .attr \width, 0
            .attr \height, 0
      ..exit!
        .transition!delay 150
          .remove!
      ..enter!append \g
        .attr \class, \data
        .attr \transform, (d,i) ->
          idx = d._order
          [x, y] = [cw * (idx % c), ch * (Math.floor(idx / c))]
          "translate(#x, #y)"
        .append \rect
          .attr \class, \data
          .attr \opacity, 0
          .attr \x, cw/2
          .attr \y, ch/2
          .attr \width, 0
          .attr \height, 0

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
        d3.select(@).select \rect.data
          .attr \fill, (d,i) -> tint.get d.cat
          .transition!duration 350
          .attr \opacity, 1
          .attr \x, 0
          .attr \y, 0
          .attr \width, cw * (1 - pad)
          .attr \height, ch * (1 - pad)
          .attr \mask, "url(\#mymask)"

    mask = ""
    p = if @cfg.shape and @cfg.shape.0 => Promise.resolve @cfg.shape.0
    else Promise.resolve(sample-icon)
    p
      .then (url) ~>
        pad = cfg.padding or 0
        mask = """
        <image xlink:href="#url" width="#{cw * (1 - pad)}" height="#{ch * (1 - pad)}" filter="url(\#fill)"/>
        """
        @svg.querySelector('g.defs').innerHTML = """
        <defs>
          <filter id="fill"><feColorMatrix in="SourceGraphic" type="matrix"
          values="0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0"/></filter>
          <mask id="mymask">#mask</mask>
        </defs>
        """

    @legend.render!
