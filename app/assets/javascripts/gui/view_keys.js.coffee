# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

 SCALE=0.5

 $(document).ready ->
  canvas = $('canvas#image')
  org_width = canvas.attr('width')
  org_height = canvas.attr('height')
  canvas.attr('width',  org_width*SCALE)
  canvas.attr('height',  org_height*SCALE)
  ctx = canvas[0].getContext('2d')
  ctx.lineWidth = 1
  image = new Image()
  image.src = $('#image_file').data('image-file')
  image.onload = ->
    ctx.clearRect(0, 0, canvas.width(), canvas.height())
    ctx.drawImage(image, 0, 0, canvas.width(), canvas.height())
    ctx.savePrevData()
    ctx.initData()

  ctx.savePrevData = ->
    @.prevImageData = @.getImageData(0, 0, canvas.width(), canvas.height())

  ctx.initData = ->
    x = $('#view_key_x').text()*SCALE
    y = $('#view_key_y').text()*SCALE
    w = $('#view_key_w').text()*SCALE
    h = $('#view_key_h').text()*SCALE
    @.fillStyle = "rgba(255,0,0,0.5)"
    @.fillRect(x, y, w, h)

  mousedown = false

  canvas.mousedown (e)->
    return unless location.href.match(/edit$/)
    ctx.putImageData(ctx.prevImageData, 0, 0)
    ctx.prevPos = getPointPosition(e)
    mousedown = true
    ctx.putPoint(ctx.prevPos.x, ctx.prevPos.y)

  canvas.mousemove (e)->
    return unless mousedown
    nowPos = getPointPosition(e)
    ctx.putImageData(ctx.prevImageData, 0, 0)
    w = nowPos.x-ctx.prevPos.x
    h = nowPos.y-ctx.prevPos.y
    ctx.fillStyle = "rgba(255,0,0,0.5)"
    ctx.fillRect(ctx.prevPos.x, ctx.prevPos.y, w, h)
    $("#view_key_x").text(ctx.prevPos.x/SCALE)
    $("#gui_view_key_x")[0].value = ctx.prevPos.x/SCALE
    $("#view_key_y").text(ctx.prevPos.y/SCALE)
    $("#gui_view_key_y")[0].value = ctx.prevPos.y/SCALE
    $("#view_key_w").text(w/SCALE)
    $("#gui_view_key_width")[0].value = w/SCALE
    $("#view_key_h").text(h/SCALE)
    $("#gui_view_key_height")[0].value = h/SCALE

  canvas.mouseup (e)->
    mousedown = false
  
  canvas.mouseout (e)->
    mousedown = false

  getPointPosition = (e)->
    {x: Math.round(e.pageX-canvas.offset().left-2), y: Math.round(e.pageY-canvas.offset().top-2)}
