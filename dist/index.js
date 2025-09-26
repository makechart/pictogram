(function(){
  var utils, sampleIcon, mod;
  utils = {};
  utils.preproc = function(arg$){
    var canvas, light, ctx, imageData, pixels, histogram, i$, ref$, len$, i, brightness, ref1$;
    canvas = arg$.canvas, light = arg$.light;
    ctx = canvas.getContext('2d');
    imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
    pixels = imageData.data;
    histogram = [];
    for (i$ = 0, len$ = (ref$ = (fn$())).length; i$ < len$; i$ += 4) {
      i = ref$[i$];
      brightness = 0.299 * pixels[i] + 0.587 * pixels[i + 1] + 0.114 * pixels[i + 2];
      if (pixels[i + 3]) {
        histogram.push(brightness);
      }
    }
    histogram.sort(function(a, b){
      if (a < b) {
        return -1;
      } else if (a > b) {
        return 1;
      } else {
        return 0;
      }
    });
    light = histogram[(ref$ = Math.floor(light * histogram.length)) < (ref1$ = histogram.length - 1) ? ref$ : ref1$];
    for (i$ = 0, len$ = (ref$ = (fn1$())).length; i$ < len$; i$ += 4) {
      i = ref$[i$];
      brightness = 0.299 * pixels[i] + 0.587 * pixels[i + 1] + 0.114 * pixels[i + 2];
      if (brightness <= light) {
        pixels[i] = 0;
        pixels[i + 1] = 0;
        pixels[i + 2] = 0;
      } else {
        pixels[i] = 255;
        pixels[i + 1] = 255;
        pixels[i + 2] = 255;
      }
    }
    return ctx.putImageData(imageData, 0, 0);
    function fn$(){
      var i$, to$, results$ = [];
      for (i$ = 0, to$ = pixels.length - 4; i$ <= to$; ++i$) {
        results$.push(i$);
      }
      return results$;
    }
    function fn1$(){
      var i$, to$, results$ = [];
      for (i$ = 0, to$ = pixels.length - 4; i$ <= to$; ++i$) {
        results$.push(i$);
      }
      return results$;
    }
  };
  sampleIcon = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48c3ZnIHZpZXdCb3g9IjAgMCAxMDAgMTAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDBweCIgaGVpZ2h0PSIyMDBweCIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHN0eWxlPSJ3aWR0aDoxMDAlO2hlaWdodDoxMDAlO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0LXk6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdC14OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbi15OmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbi14OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNvbG9yOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7YmFja2dyb3VuZC1hdHRhY2htZW50OmluaXRpYWw7YW5pbWF0aW9uLXBsYXktc3RhdGU6cGF1c2VkIiA+PGcgY2xhc3M9ImxkbC1zY2FsZSIgc3R5bGU9InRyYW5zZm9ybS1vcmlnaW46NTAlIDUwJTt0cmFuc2Zvcm06cm90YXRlKDBkZWcpIHNjYWxlKDEsIDEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjxjaXJjbGUgZmlsbD0iIzg0OWI4NyIgcj0iMTAuODc2IiBjeT0iMTUuODc2IiBjeD0iNTAiIHN0eWxlPSJmaWxsOnJnYigyOSwgMTQsIDExKTthbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID48L2NpcmNsZT4KPGcgc3R5bGU9ImFuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjxwYXRoIGZpbGw9IiM4NDliODciIGQ9Ik02OC43NjQgNTguNjM1YTMuOTg1IDMuOTg1IDAgMCAxLTMuOTg1LTMuOTg1di02LjY0MmMwLTguMTQ5LTYuNjMtMTQuNzc5LTE0Ljc3OS0xNC43NzlzLTE0Ljc3OSA2LjYzLTE0Ljc3OSAxNC43Nzl2Ni42NDJhMy45ODUgMy45ODUgMCAxIDEtNy45NyAwdi02LjY0MmMwLTEyLjU0NCAxMC4yMDUtMjIuNzQ5IDIyLjc0OS0yMi43NDlzMjIuNzQ5IDEwLjIwNSAyMi43NDkgMjIuNzQ5djYuNjQyYzAgMi4yLTEuNzg0IDMuOTg1LTMuOTg1IDMuOTg1eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD48L2c+CjxwYXRoIGQ9Ik0zOC40MTcgMzIuMTY3aDIzLjE2N3YzMy42NjdIMzguNDE3eiIgZmlsbD0iIzg0OWI4NyIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPHBhdGggZmlsbD0iIzg0OWI4NyIgZD0iTTQzLjM5OSA1My40ODdhNC45NCA0Ljk0IDAgMCAwLTQuOTQgNC45NFY5MC4wNmE0Ljk0IDQuOTQgMCAwIDAgOS44OCAwVjU4LjQyN2E0Ljk0IDQuOTQgMCAwIDAtNC45NC00Ljk0eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPHBhdGggZmlsbD0iIzg0OWI4NyIgZD0iTTU2LjYwMSA1My40ODdhNC45NCA0Ljk0IDAgMCAxIDQuOTQgNC45NFY5MC4wNmE0Ljk0IDQuOTQgMCAwIDEtOS44OCAwVjU4LjQyN2E0Ljk0IDQuOTQgMCAwIDEgNC45NC00Ljk0eiIgc3R5bGU9ImZpbGw6cmdiKDI5LCAxNCwgMTEpO2FuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPjwvcGF0aD4KPG1ldGFkYXRhIHhtbG5zOmQ9Imh0dHBzOi8vbG9hZGluZy5pby9zdG9jay8iIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID48ZDpuYW1lIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID5tYW48L2Q6bmFtZT4KCgo8ZDp0YWdzIHN0eWxlPSJhbmltYXRpb24tcGxheS1zdGF0ZTpwYXVzZWQiID5tYW4scGVvcGxlLGNoYXJhY3RlcixwZXJzb24sZmlndXJlLGlkb2wsZG9sbDwvZDp0YWdzPgoKCjxkOmxpY2Vuc2Ugc3R5bGU9ImFuaW1hdGlvbi1wbGF5LXN0YXRlOnBhdXNlZCIgPmJ5PC9kOmxpY2Vuc2U+CgoKPGQ6c2x1ZyBzdHlsZT0iYW5pbWF0aW9uLXBsYXktc3RhdGU6cGF1c2VkIiA+bXE1dXg8L2Q6c2x1Zz48L21ldGFkYXRhPjwvZz48IS0tIGdlbmVyYXRlZCBieSBodHRwczovL2xvYWRpbmcuaW8vIC0tPjwvc3ZnPg==";
  module.exports = {
    pkg: {
      name: 'pictogram',
      version: '0.0.1',
      extend: {
        name: "base",
        version: "0.0.1"
      },
      dependencies: [
        {
          name: "ldfile",
          version: 'main',
          path: "index.min.js"
        }, {
          name: "potrace-wasm",
          version: 'main',
          path: "index.js",
          global: true
        }
      ],
      i18n: {}
    },
    init: function(arg$){
      var root, ctx, t, pubsub;
      root = arg$.root, ctx = arg$.ctx, t = arg$.t, pubsub = arg$.pubsub;
      return pubsub.fire('init', {
        mod: mod({
          ctx: ctx,
          t: t
        })
      });
    }
  };
  mod = function(arg$){
    var ctx, t, chart, d3, debounce, ldfile, loadFromCanvas, ref$;
    ctx = arg$.ctx, t = arg$.t;
    chart = ctx.chart, d3 = ctx.d3, debounce = ctx.debounce, ldfile = ctx.ldfile, loadFromCanvas = ctx.loadFromCanvas;
    utils.traceSvg = function(opt){
      return new Promise(function(res, rej){
        var size, light, file, img, fr;
        size = opt.size || 256;
        light = opt.light || 0.5;
        file = opt.file;
        img = new Image();
        img.onload = function(){
          var canvas, ctx, scale, ref$, iw, ih;
          canvas = document.createElement('canvas');
          ctx = canvas.getContext('2d');
          scale = Math.min(size / img.width, size / img.height);
          canvas.width = size;
          canvas.height = size;
          ref$ = [img.width * scale, img.height * scale], iw = ref$[0], ih = ref$[1];
          ctx.drawImage(img, (size - iw) / 2, (size - ih) / 2, iw, ih);
          utils.preproc({
            canvas: canvas,
            light: light
          });
          return loadFromCanvas(canvas, {}).then(function(svg){
            return res(svg);
          })['catch'](function(e){
            return rej(e);
          });
        };
        if (typeof file === 'string') {
          return img.src = file;
        } else {
          fr = new FileReader();
          fr.onload = function(){
            return img.src = fr.result;
          };
          return fr.readAsDataURL(file);
        }
      });
    };
    return {
      sample: function(){
        return {
          raw: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100].map(function(val){
            return {
              name: "N-" + val,
              cat: "Type " + Math.ceil(Math.random() * 4),
              value: Math.ceil(Math.random() * 3)
            };
          }),
          binding: {
            cat: {
              key: 'cat'
            },
            name: {
              key: 'name'
            }
          }
        };
      },
      config: (ref$ = chart.utils.config.from({
        preset: 'default',
        legend: 'legend',
        tip: 'tip'
      }), ref$.shape = {
        glyph: {
          type: 'upload'
        },
        threshold: {
          type: 'number',
          'default': 0.5,
          min: 0,
          max: 1,
          step: 0.01
        }
      }, ref$.padding = {
        type: 'number',
        'default': 0,
        min: -1,
        max: 1,
        step: 0.01
      }, ref$),
      dimension: {
        value: {
          type: 'R'
        },
        cat: {
          type: 'C'
        },
        name: {
          type: 'N'
        }
      },
      init: function(){
        var tint, this$ = this;
        this.tint = tint = new chart.utils.tint();
        this.g = Object.fromEntries(['view', 'legend'].map(function(it){
          return [it, d3.select(this$.layout.getGroup(it))];
        }));
        this.g.defs = d3.select(this.svg).append('g').attr('class', 'defs');
        this.defs = this.g.defs.append('defs');
        this.tip = new chart.utils.tip({
          root: this.root,
          accessor: function(arg$){
            var evt, d;
            evt = arg$.evt;
            if (!(evt.target && (d = d3.select(evt.target).datum()))) {
              return null;
            }
            return {
              name: (d.cat ? d.cat + " / " : '') + (d.name || ''),
              value: ''
            };
          },
          range: function(){
            return this$.layout.getNode('view').getBoundingClientRect();
          }
        });
        this.legend = new chart.utils.legend({
          layout: this.layout,
          name: 'legend',
          root: this.root,
          shape: function(d){
            return d3.select(this).attr('fill', tint.get(d.key));
          }
        });
        return this.legend.on('select', function(){
          this$.parse();
          this$.bind();
          this$.resize();
          return this$.render();
        });
      },
      destroy: function(){
        if (this.tip) {
          return this.tip.destroy();
        }
      },
      parse: function(){
        var hash, res$, k, v, list, this$ = this;
        hash = {};
        if (this.binding.cat) {
          this.data.map(function(d){
            return hash[d.cat] = true;
          });
          res$ = [];
          for (k in hash) {
            v = hash[k];
            res$.push(k);
          }
          this.cats = res$;
          if (this.binding.value != null) {
            list = this.data.map(function(d){
              var i$, to$, i, results$ = [];
              for (i$ = 0, to$ = d.value; i$ < to$; ++i$) {
                i = i$;
                results$.push({
                  cat: d.cat,
                  name: d.name
                });
              }
              return results$;
            }).reduce(function(a, b){
              return a.concat(b);
            }, []);
          } else {
            list = this.data;
          }
        } else {
          hash[''] = true;
          this.cats = [];
          if (this.binding.value != null) {
            list = this.data.map(function(d){
              var i$, to$, i, results$ = [];
              for (i$ = 0, to$ = d.value; i$ < to$; ++i$) {
                i = i$;
                results$.push({
                  cat: '',
                  name: d.name
                });
              }
              return results$;
            }).reduce(function(a, b){
              return a.concat(b);
            }, []);
          } else {
            list = this.data.map(function(d){
              return {
                cat: '',
                name: d.name
              };
            });
          }
        }
        list.map(function(d, i){
          return d._idx = i;
        });
        this.cats.sort();
        this.legend.data(this.cats.map(function(it){
          return {
            key: it,
            text: it
          };
        }));
        this.parsed = list.filter(function(it){
          return !this$.cats.length || !this$.cfg.legend.enabled || this$.legend.isSelected(it.cat);
        });
        this.parsed.map(function(it){
          return it._removing = false;
        });
        this.parsed.sort(function(a, b){
          if (hash[a.cat] < hash[b.cat]) {
            return 1;
          } else if (hash[a.cat] > hash[b.cat]) {
            return -1;
          }
          return a.cat < b.cat
            ? -1
            : a.cat > b.cat ? 1 : 0;
        });
        this.parsed.map(function(d, i){
          return d._order = i;
        });
        return this.sum = this.parsed.length;
      },
      resize: function(){
        var ref$;
        this.tip.toggle(((ref$ = this.cfg).tip || (ref$.tip = {})).enabled != null ? this.cfg.tip.enabled : true);
        this.legend.config(this.cfg.legend);
        this.root.querySelector('.pdl-layout').classList.toggle('legend-bottom', this.cfg.legend.position === 'bottom');
        this.legend.update();
        this.layout.update(false);
        return this.tint.set(this.cfg.palette.colors.map(function(it){
          return it.value || it;
        }));
      },
      render: function(){
        var tint, cfg, q, ref$, r, c, box, cw, ch, x$, this$ = this;
        tint = this.tint, cfg = this.cfg;
        q = Math.round(Math.sqrt(this.sum));
        ref$ = [q || 1, Math.ceil(this.sum / q) || 1], r = ref$[0], c = ref$[1];
        box = this.layout.getBox('view');
        ref$ = [box.width / c, box.height / r], cw = ref$[0], ch = ref$[1];
        x$ = this.g.view.selectAll('g.data').data(this.parsed, function(it){
          return it._idx;
        });
        x$.exit().each(function(d, i){
          d._removing = true;
          return d3.select(this).select('use.data').transition().duration(150).attr('x', cw / 2).attr('y', cw / 2).attr('opacity', 0).attr('transform', "scale(0,0)");
        });
        x$.exit().transition().delay(150).remove();
        x$.enter().append('g').attr('class', 'data').attr('transform', function(d, i){
          var idx, ref$, x, y;
          idx = d._order;
          ref$ = [cw * (idx % c), ch * Math.floor(idx / c)], x = ref$[0], y = ref$[1];
          return "translate(" + x + ", " + y + ")";
        }).append('use').attr('class', 'data').attr('opacity', 0).attr('x', cw / 2).attr('y', ch / 2).attr('transform', "scale(0,0)");
        this.g.view.selectAll('g.data').transition().duration(350).attr('transform', function(d, i){
          var pad, idx, ref$, x, y;
          pad = cfg.padding || 0;
          idx = d._order;
          ref$ = [cw * (idx % c), ch * Math.floor(idx / c)], x = ref$[0], y = ref$[1];
          ref$ = [x + cw * pad / 2, y + ch * pad / 2], x = ref$[0], y = ref$[1];
          return "translate(" + x + ", " + y + ")";
        });
        this.g.view.selectAll('g.data').each(function(d, i){
          var pad, scale;
          if (d._removing) {
            return;
          }
          pad = cfg.padding || 0;
          scale = Math.min((cw * (1 - pad)) / 256, (ch * (1 - pad)) / 256);
          return d3.select(this).select('use.data').transition().duration(350).attr('fill', function(d, i){
            return tint.get(d.cat);
          }).attr('opacity', 1).attr('x', 0).attr('y', 0).attr('transform', "scale(" + scale + "," + scale + ")").attr('href', '#glyph');
        });
        q = this.p
          ? this.p
          : Promise.resolve();
        this.p = q.then(function(){
          var file, url;
          file = (this$.cfg.shape.glyph || [])[0] || {};
          url = file.dataurl || sampleIcon;
          return utils.traceSvg({
            file: url,
            light: this$.cfg.shape.threshold
          });
        }).then(function(svg){
          var div, g;
          div = document.createElement('div');
          div.innerHTML = svg;
          g = div.querySelector('g').cloneNode(true);
          g.setAttribute('id', 'glyph');
          g.removeAttribute('fill');
          this$.svg.querySelector('g.defs defs').innerHTML = "";
          return this$.svg.querySelector('g.defs defs').appendChild(g);
        });
        return this.legend.render();
      }
    };
  };
}).call(this);
