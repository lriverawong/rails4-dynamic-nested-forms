jQuery(document).on 'turbolinks:load', ->
# jQuery ->
  addresses = $('#addresses')

  # dynamic counting of nested addresses
  count = addresses.find('.count > span')
  recount = -> count.text addresses.find('.nested-fields').size()

  # Animations for insertion and removal
  addresses.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)
  addresses.on 'cocoon:after-insert', (e, added_el) ->
    added_el.effect('highlight', {}, 500)
    recount()
  # $(this).data('remove-timeout', 1000) says Cocoon to delay the element’s removal by 1 second – just enough for us to perform the animation.
  addresses.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)
  addresses.on 'cocoon:after-remove', (e, removed_el) ->
    recount()
