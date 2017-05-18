
follow_element = (selected_element_path) ->
  if(selected_element_path)
    console.log("sending "+selected_element_path)
    $.ajax
      dataType: 'application/json'
      type: 'POST'
      url: '/follow'
      data: { selected_element_path: selected_element_path }
      success: (data, textStatus, jqXHR) ->
        console.log(data)

$ ->
  console.log("ok");
  
  previously_hovered_element_path = undefined
  $('#followed-page').on 'mousemove', (event) ->
    x = event.clientX
    y = event.clientY
    # console.log(x + ' ' + y)
    hovered_element = document.elementFromPoint(x, y)
    hovered_element_path = UTILS.cssPath(hovered_element)
    # console.log(path)
    $(hovered_element_path).addClass('preselected')
    if(previously_hovered_element_path != hovered_element_path)
      $(previously_hovered_element_path).removeClass('preselected')
      previously_hovered_element_path = hovered_element_path;
  
  selected_element_path = undefined;
  $('#followed-page').on 'click', (event) ->
    $('.selected').removeClass('selected')
    if(previously_hovered_element_path)
      selected_element_path = previously_hovered_element_path
      $(previously_hovered_element_path).addClass('selected')
      $('#selector').val(previously_hovered_element_path)