# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

 SCALE=0.5

 $(document).ready ->
  canvas = $('#image')
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

  ctx.savePrevData = ->
    @.prevImageData = @.getImageData(0, 0, canvas.width(), canvas.height())

  paintArea = (area)->
    ctx.fillStyle = "rgba(255,0,0,0.5)"
    ctx.fillRect(area.x, area.y, area.w, area.h)

  showLogicInfo = (obj)->
    $("#logic_module").text($(obj).data('logic-module'))
    link_element = document.createElement('a')
    link_element.href = $(obj).data('logic-link')
    link_element.innerHTML = $(obj).data('logic-name')
    $("#logic_name").empty()
    $("#logic_name").append(link_element)
    $("#logic_symbol").text($(obj).data('logic-symbol'))
    $("#update_on_realtime").text($(obj).data('update-on-realtime'))
    $("#update_on_activate").text($(obj).data('update-on-activate'))

  canvas.mousedown (e)->
    ctx.putImageData(ctx.prevImageData, 0, 0)
    pos = getPointPosition(e)
    selectedObjs = []
    for obj in $('table#view_keys td')
      area = {x:$(obj).attr("x")*SCALE, y:$(obj).attr("y")*SCALE, w:$(obj).attr("w")*SCALE, h:$(obj).attr("h")*SCALE}
      max_x = parseInt(area.x) + parseInt(area.w)
      max_y = parseInt(area.y) + parseInt(area.h)
      if area.x <= pos.x and pos.x <= max_x and area.y <= pos.y and pos.y <= max_y
        selectedObjs.push(obj)
      else
        $(obj).removeClass("selected")
    selected = false
    for obj in selectedObjs
      $('#db').text($(obj).hasClass("selected"))
      area = {x:$(obj).attr("x")*SCALE, y:$(obj).attr("y")*SCALE, w:$(obj).attr("w")*SCALE, h:$(obj).attr("h")*SCALE}
      if $(obj).hasClass("selected") && (1 != selectedObjs.length)
        $(obj).removeClass("selected")
      else
        if (false == selected)
          paintArea(area)
          $(obj).addClass("selected")
          showLogicInfo(obj)
          selected = true


  getPointPosition = (e)->
    {x: Math.round(e.pageX-canvas.offset().left-2), y: Math.round(e.pageY-canvas.offset().top-2)}

  $('table#view_keys').mouseover (e)->
    return unless e.target.tagName == "TD"
    ctx.putImageData(ctx.prevImageData, 0, 0)
    area = {x:$(e.target).attr("x")*SCALE, y:$(e.target).attr("y")*SCALE, w:$(e.target).attr("w")*SCALE, h:$(e.target).attr("h")*SCALE}
    paintArea(area)
    for obj in $('table#view_keys td')
      $(obj).removeClass("selected")
    $(e.target).addClass("selected")
    showLogicInfo(e.target)
